# Imports:
import os
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# Aliases:
ALT = "mod1"
MOD = "mod4"
TERMINAL = 'kitty'
MONO_FONT = "Monospace"
MONO_SIZE = 14
SANS = "Roboto"


def read(_file: str):
    """File reader"""
    with open(_file, encoding="utf-8") as handler:
        content = handler.read()
    return content


class Battery:
    """Custom battery widget"""

    def __init__(self) -> None:
        self.battery_icons = {
            "c1":  " ", "c2":  " ", "c3":  " ", "c4":  " ", "c5":  " ",
            "c6":  " ", "c7":  " ", "c8":  " ", "c9":  " ", "c10": " ",

            "d1":  "", "d2":  "", "d3":  "", "d4":  "", "d5":  "",
            "d6":  "", "d7":  "", "d8":  "", "d9":  "", "d10": ""

        }
        self.charging = (read("/sys/class/power_supply/BAT0/status") == "Full")
        self.capacity = int(read("/sys/class/power_supply/BAT0/capacity"))
        if self.charging:
            self.icon = self.battery_icons[f"c{int(self.capacity / 10)}"]
        else:
            self.icon = self.battery_icons[f"d{int(self.capacity / 10)}"]

    def GetStatus(self) -> str:
        """Returns battery status with icons"""
        return f"{self.capacity}% {self.icon}"


battery = Battery()


keys = [
    # Switch between windows
    Key(
        [MOD], "h",
        lazy.layout.left(),
        desc="Move focus to left"
    ),
    Key(
        [MOD], "l",
        lazy.layout.right(),
        desc="Move focus to right"
    ),
    Key(
        [MOD], "j",
        lazy.layout.down(),
        desc="Move focus down"
    ),
    Key(
        [MOD], "k",
        lazy.layout.up(),
        desc="Move focus up"
    ),
    Key(
        [MOD], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
    ),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [MOD, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),
    Key(
        [MOD, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
    ),
    Key(
        [MOD, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),
    Key(
        [MOD, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"
    ),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [MOD, "control"], "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"
    ),
    Key(
        [MOD, "control"], "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
    ),
    Key(
        [MOD, "control"], "j",
        lazy.layout.grow_down(), desc="Grow window down"
    ),
    Key(
        [MOD, "control"], "k",
        lazy.layout.grow_up(),
        desc="Grow window up"
    ),
    Key(
        [MOD], "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes

    # Volume control
    Key(
        [], "XF86AudioMute",
        lazy.spawn("pulsemixer --toggle-mute"),
        desc="Toggle mute"
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("pulsemixer --change-volume +2"),
        desc="Increase volume"
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("pulsemixer --change-volume -2"),
        desc="Decrease volume"
    ),

    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [MOD], "Return",
        lazy.spawn(TERMINAL),
        desc="Launch terminal"
    ),
    Key(
        [MOD], "w",
        lazy.window.kill(),
        desc="Close focused window"
    ),
    Key(
        [MOD, ALT], "r",
        lazy.reload_config(),
        desc="Reload the configuration"
    ),
    Key(
        [MOD, ALT], "q",
        lazy.shutdown(),
        desc="Log out"
    ),
    Key(
        [MOD], "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen"
    ),
    Key(
        [MOD], "p",
        lazy.spawn(f'dmenu_run -p "Run:" -fn "{MONO_FONT}-{MONO_SIZE}"'),
        desc="Launches Dmenu"
    ),
    Key(
        [MOD], "Tab",
        lazy.function(
            lambda node:
            node.current_screen.set_group(node.current_screen.previous_group)
        )
    ),
]


groups = [
    Group(name="1", label=''),
    Group(name="2", label=''),
    Group(name="3", label=''),
    Group(name="4", label=''),
    Group(name="5", label=''),
    Group(name="6", label=''),
    Group(name="7", label=''),
    Group(name="8", label=''),
    Group(name="9", label='')
]

for i in groups:
    keys.extend([
        # Switch to group
        Key(
                [MOD], i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i),
                ),
        # Switch to & move focused window to group
        Key(
            [MOD, "shift"], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i),
        ),
    ])


layouts = [
    layout.Bsp(
        border_focus_stack=[
            "#1E90FF",
            "#ADD8E6"
        ],
        border_width=2,
        margin=[10, 10, 10, 10]
    ),

    layout.Stack(num_stacks=2),
    layout.VerticalTile(),
]

widget_defaults = {
    "font": SANS,
    "fontsize": 14,
    "padding": 3
}

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.TextBox("", foreground="#0f94d2", mouse_callbacks={
                    'Button1': lambda: os.popen('rofi -show drun')
                }),
                widget.GroupBox(),
                widget.TextBox(" "),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(),
                widget.TextBox(" "),
                # widget.BatteryIcon(),
                # widget.Battery(format='{percent:2.0%} {hour:d}:{min:02d}'),
                widget.TextBox(battery.GetStatus()),
                # widget.TextBox(" "),
                widget.Clock(format="📅 %a 🕑 %H:%M"),
                # widget.QuickExit(),
            ],
            25,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup_once
def _():
    cmds = [
        'redshift',
        # 'nitrogen --restore',
        'PyGen',
        'flameshot',
        'blueman-applet',
        'nm-applet',
    ]
    for cmd in cmds:
        os.popen(cmd)
