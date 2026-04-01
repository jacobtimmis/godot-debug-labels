@tool
class_name DebugLabelsPlugin
extends EditorPlugin

const SEPARATOR_SETTING_PATH = "debug_labels/separator"
const SEPARATOR_SETTING_DEFAULT = ": "


static func get_separator() -> String:
    return ProjectSettings.get_setting(SEPARATOR_SETTING_PATH, SEPARATOR_SETTING_DEFAULT)


func _enter_tree():
    if not ProjectSettings.has_setting(SEPARATOR_SETTING_PATH):
        ProjectSettings.set_setting(SEPARATOR_SETTING_PATH, SEPARATOR_SETTING_DEFAULT)
    ProjectSettings.set_initial_value(SEPARATOR_SETTING_PATH, SEPARATOR_SETTING_DEFAULT)

    ProjectSettings.add_property_info(
        {
            "name": SEPARATOR_SETTING_PATH,
            "type": TYPE_STRING,
            "hint": PROPERTY_HINT_NONE,
            "hint_string": "",
        },
    )

    ProjectSettings.save()

    print("Debug Labels Plugin Enabled")


func _exit_tree():
    print("Debug Labels Plugin Disabled")
