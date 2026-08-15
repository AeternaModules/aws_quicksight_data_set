output "quicksight_data_sets_id" {
  description = "Map of id values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "quicksight_data_sets_arn" {
  description = "Map of arn values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "quicksight_data_sets_aws_account_id" {
  description = "Map of aws_account_id values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.aws_account_id if v.aws_account_id != null && length(v.aws_account_id) > 0 }
}
output "quicksight_data_sets_column_groups" {
  description = "Map of column_groups values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.column_groups if v.column_groups != null && length(v.column_groups) > 0 }
}
output "quicksight_data_sets_column_level_permission_rules" {
  description = "Map of column_level_permission_rules values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.column_level_permission_rules if v.column_level_permission_rules != null && length(v.column_level_permission_rules) > 0 }
}
output "quicksight_data_sets_data_set_id" {
  description = "Map of data_set_id values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.data_set_id if v.data_set_id != null && length(v.data_set_id) > 0 }
}
output "quicksight_data_sets_data_set_usage_configuration" {
  description = "Map of data_set_usage_configuration values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => one(v.data_set_usage_configuration) if v.data_set_usage_configuration != null && length(v.data_set_usage_configuration) > 0 }
}
output "quicksight_data_sets_field_folders" {
  description = "Map of field_folders values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.field_folders if v.field_folders != null && length(v.field_folders) > 0 }
}
output "quicksight_data_sets_import_mode" {
  description = "Map of import_mode values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.import_mode if v.import_mode != null && length(v.import_mode) > 0 }
}
output "quicksight_data_sets_logical_table_map" {
  description = "Map of logical_table_map values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.logical_table_map if v.logical_table_map != null && length(v.logical_table_map) > 0 }
}
output "quicksight_data_sets_name" {
  description = "Map of name values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "quicksight_data_sets_output_columns" {
  description = "Map of output_columns values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.output_columns if v.output_columns != null && length(v.output_columns) > 0 }
}
output "quicksight_data_sets_permissions" {
  description = "Map of permissions values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.permissions if v.permissions != null && length(v.permissions) > 0 }
}
output "quicksight_data_sets_physical_table_map" {
  description = "Map of physical_table_map values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.physical_table_map if v.physical_table_map != null && length(v.physical_table_map) > 0 }
}
output "quicksight_data_sets_refresh_properties" {
  description = "Map of refresh_properties values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => one(v.refresh_properties) if v.refresh_properties != null && length(v.refresh_properties) > 0 }
}
output "quicksight_data_sets_region" {
  description = "Map of region values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.region if v.region != null && length(v.region) > 0 }
}
output "quicksight_data_sets_row_level_permission_data_set" {
  description = "Map of row_level_permission_data_set values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => one(v.row_level_permission_data_set) if v.row_level_permission_data_set != null && length(v.row_level_permission_data_set) > 0 }
}
output "quicksight_data_sets_row_level_permission_tag_configuration" {
  description = "Map of row_level_permission_tag_configuration values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => one(v.row_level_permission_tag_configuration) if v.row_level_permission_tag_configuration != null && length(v.row_level_permission_tag_configuration) > 0 }
}
output "quicksight_data_sets_tags" {
  description = "Map of tags values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "quicksight_data_sets_tags_all" {
  description = "Map of tags_all values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "quicksight_data_sets_use_as" {
  description = "Map of use_as values across all quicksight_data_sets, keyed the same as var.quicksight_data_sets"
  value       = { for k, v in aws_quicksight_data_set.quicksight_data_sets : k => v.use_as if v.use_as != null && length(v.use_as) > 0 }
}

