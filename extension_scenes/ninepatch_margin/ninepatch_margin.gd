tool
extends NinePatchRect
class_name NinePatchMargin

export (bool) var update_chlid_margins = false setget editor_update_child_margins
var extra_padding_right setget editor_update_extra_padding_right
var extra_padding_left setget editor_update_extra_padding_left
var extra_padding_top setget editor_update_extra_padding_top
var extra_padding_bottom setget editor_update_extra_padding_bottom

func _get_property_list():
	var properties = []
	properties.append({
		name = "Extra Padding",
		type = TYPE_NIL,
		hint_string = "extra_padding_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "extra_padding_left",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 240, 0.1",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "extra_padding_right",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 240, 0.1",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "extra_padding_top",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 240, 0.1",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "extra_padding_bottom",
		type = TYPE_REAL,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 240, 0.1",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "Patch Margin Shortcut",
		type = TYPE_NIL,
		hint_string = "patch_margin_",
		usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	
	properties.append({
		name = "patch_margin_left",
		type = TYPE_INT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 16384",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "patch_margin_right",
		type = TYPE_INT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 16384",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "patch_margin_top",
		type = TYPE_INT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 16384",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "patch_margin_bottom",
		type = TYPE_INT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0, 16384",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	return properties

func set_patch_margin(margin:int, value:int):
	print("o")
	.set_patch_margin(margin,value)
	
#"ujjjj9iooooooo"
func editor_update_child_margins(_update:bool):
	if Engine.is_editor_hint():
		sort_children()

func editor_update_extra_padding_right(amount:float):
	extra_padding_right = amount
	sort_children()

func editor_update_extra_padding_left(amount:float):
	extra_padding_left = amount
	sort_children()

func editor_update_extra_padding_top(amount:float):
	extra_padding_top = amount
	sort_children()

func editor_update_extra_padding_bottom(amount:float):
	extra_padding_bottom = amount
	sort_children()

func sort_children():
	var child_count = get_child_count()
	for i in child_count:
		var current_child = get_child(i)
		current_child.set_anchors_preset(Control.PRESET_WIDE)
		current_child.margin_right = - self.patch_margin_right - extra_padding_right
		current_child.margin_left = self.patch_margin_left + extra_padding_left
		current_child.margin_top = self.patch_margin_top + extra_padding_top
		current_child.margin_bottom = - self.patch_margin_bottom - extra_padding_bottom
