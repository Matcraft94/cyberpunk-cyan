#!/usr/bin/python3
import sys
import signal
import gi

gi.require_version('Gtk', '3.0')
try:
    gi.require_version('WebKit2', '4.1')
except ValueError:
    gi.require_version('WebKit2', '4.0')
from gi.repository import Gtk, WebKit2, Gdk, Gio

HTML_PATH = "/home/lucy/.config/omarchy/screensaver/glitch/index.html"


class GlitchApp(Gtk.Application):
    def __init__(self):
        super().__init__(
            application_id="org.omarchy.screensaver",
            flags=Gio.ApplicationFlags.FLAGS_NONE,
        )
        self.window = None

    def do_activate(self):
        if self.window is not None:
            self.window.present()
            return

        self.window = Gtk.ApplicationWindow(application=self)
        self.window.set_title("Omarchy Screensaver")
        self.window.set_decorated(False)
        self.window.set_keep_above(True)
        self.window.fullscreen()

        webview = WebKit2.WebView()
        settings = webview.get_settings()
        settings.set_property("enable-media-stream", False)
        settings.set_property("enable-webgl", False)
        settings.set_property("enable-javascript", True)
        webview.load_uri(f"file://{HTML_PATH}")
        self.window.add(webview)

        # Close the app when the webview requests close (window.close() in JS)
        webview.connect("close", self.on_webview_close)

        # Input events on the window also close the screensaver
        self.window.connect("key-press-event", self.on_input)
        self.window.connect("button-press-event", self.on_input)
        self.window.connect("motion-notify-event", self.on_input)
        self.window.connect("scroll-event", self.on_input)
        self.window.connect("destroy", self.on_destroy)

        self.window.add_events(
            Gdk.EventMask.BUTTON_PRESS_MASK
            | Gdk.EventMask.POINTER_MOTION_MASK
            | Gdk.EventMask.SCROLL_MASK
        )

        self.window.show_all()
        self.window.present()

    def on_webview_close(self, webview):
        self.quit()
        return True

    def on_input(self, widget, event):
        self.quit()
        return True

    def on_destroy(self, widget):
        self.quit()


def signal_handler(signum, frame):
    app = Gio.Application.get_default()
    if app:
        app.quit()
    else:
        Gtk.main_quit()


if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGHUP, signal_handler)

    app = GlitchApp()
    app.run(sys.argv)
