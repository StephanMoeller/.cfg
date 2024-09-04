const std = @import("std");
const c = @cImport({
    @cInclude("xcb/xcb.h");
});

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    // Connect to the X server
    var screen_num: u32 = 0;
    const connection = c.xcb_connect(null, &screen_num);
    defer c.xcb_disconnect(connection);

    if (c.xcb_connection_has_error(connection) != 0) {
        std.debug.print("Failed to connect to X server\n", .{});
        return;
    }

    const setup = c.xcb_get_setup(connection);
    const screen = c.xcb_setup_roots_iterator(setup).data;

    // Create a window
    const window: c.xcb_window_t = c.xcb_generate_id(connection);
    const value_mask: u32 = c.XCB_CW_BACK_PIXEL | c.XCB_CW_EVENT_MASK;
    var value_list = [_]u32{
        screen.pBlack_pixel,
        c.XCB_EVENT_MASK_EXPOSURE | c.XCB_EVENT_MASK_KEY_PRESS,
    };

    c.xcb_create_window(
        connection,
        c.XCB_COPY_FROM_PARENT,
        window,
        screen.root,
        0, 0,  // x, y
        150, 150,  // width, height
        10,  // border width
        c.XCB_WINDOW_CLASS_INPUT_OUTPUT,
        screen.root_visual,
        value_mask,
        @ptrCast([*]const u32, &value_list),
    );

    // Map the window (make it visible)
    c.xcb_map_window(connection, window);

    // Flush the commands to the X server
    c.xcb_flush(connection);

    // Event loop
    var event: *c.xcb_generic_event_t = undefined;
    while (true) {
        event = c.xcb_wait_for_event(connection);
        if (event == null) break;

        switch (event.response_type & ~0x80) {
            c.XCB_EXPOSE => |*ev| {
                // Handle expose event
                std.debug.print("Window exposed\n", .{});
            },
            c.XCB_KEY_PRESS => |*ev| {
                // Handle key press event
                std.debug.print("Key pressed, exiting...\n", .{});
                return;
            },
            else => {},
        }

        // Free the event
        std.c.free(event);
    }

    std.debug.print("Exiting...\n", .{});
}
