tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("PdStreamHelper", "Node", preload("PdStreamHelper.gd"), preload("icon.svg"))

func _exit_tree():
	remove_custom_type("PdStreamHelper")
