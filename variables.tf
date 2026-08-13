variable "quicksight_data_sets" {
  description = <<EOT
Map of quicksight_data_sets, attributes below
Required:
    - data_set_id
    - import_mode
    - name
Optional:
    - aws_account_id
    - region
    - tags
    - tags_all
    - use_as
    - column_groups (block):
        - geo_spatial_column_group (optional, block):
            - columns (required)
            - country_code (required)
            - name (required)
    - column_level_permission_rules (block):
        - column_names (optional)
        - principals (optional)
    - data_set_usage_configuration (block):
        - disable_use_as_direct_query_source (optional)
        - disable_use_as_imported_source (optional)
    - field_folders (block):
        - columns (optional)
        - description (optional)
        - field_folders_id (required)
    - logical_table_map (block):
        - alias (required)
        - data_transforms (optional, block):
            - cast_column_type_operation (optional, block):
                - column_name (required)
                - format (optional)
                - new_column_type (required)
            - create_columns_operation (optional, block):
                - columns (required, block):
                    - column_id (required)
                    - column_name (required)
                    - expression (required)
            - filter_operation (optional, block):
                - condition_expression (required)
            - project_operation (optional, block):
                - projected_columns (required)
            - rename_column_operation (optional, block):
                - column_name (required)
                - new_column_name (required)
            - tag_column_operation (optional, block):
                - column_name (required)
                - tags (required, block):
                    - column_description (optional, block):
                        - text (optional)
                    - column_geographic_role (optional)
            - untag_column_operation (optional, block):
                - column_name (required)
                - tag_names (required)
        - logical_table_map_id (required)
        - source (required, block):
            - data_set_arn (optional)
            - join_instruction (optional, block):
                - left_join_key_properties (optional, block):
                    - unique_key (optional)
                - left_operand (required)
                - on_clause (required)
                - right_join_key_properties (optional, block):
                    - unique_key (optional)
                - right_operand (required)
                - type (required)
            - physical_table_id (optional)
    - permissions (block):
        - actions (required)
        - principal (required)
    - physical_table_map (block):
        - custom_sql (optional, block):
            - columns (optional, block):
                - name (required)
                - type (required)
            - data_source_arn (required)
            - name (required)
            - sql_query (required)
        - physical_table_map_id (required)
        - relational_table (optional, block):
            - catalog (optional)
            - data_source_arn (required)
            - input_columns (required, block):
                - name (required)
                - type (required)
            - name (required)
            - schema (optional)
        - s3_source (optional, block):
            - data_source_arn (required)
            - input_columns (required, block):
                - name (required)
                - type (required)
            - upload_settings (required, block):
                - contains_header (optional)
                - delimiter (optional)
                - format (optional)
                - start_from_row (optional)
                - text_qualifier (optional)
    - refresh_properties (block):
        - refresh_configuration (required, block):
            - incremental_refresh (required, block):
                - lookback_window (required, block):
                    - column_name (required)
                    - size (required)
                    - size_unit (required)
    - row_level_permission_data_set (block):
        - arn (required)
        - format_version (optional)
        - namespace (optional)
        - permission_policy (required)
        - status (optional)
    - row_level_permission_tag_configuration (block):
        - status (optional)
        - tag_rules (required, block):
            - column_name (required)
            - match_all_value (optional)
            - tag_key (required)
            - tag_multi_value_delimiter (optional)
EOT

  type = map(object({
    data_set_id    = string
    import_mode    = string
    name           = string
    aws_account_id = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    use_as         = optional(string)
    column_groups = optional(list(object({
      geo_spatial_column_group = optional(object({
        columns      = list(string)
        country_code = string
        name         = string
      }))
    })))
    column_level_permission_rules = optional(list(object({
      column_names = optional(list(string))
      principals   = optional(list(string))
    })))
    data_set_usage_configuration = optional(object({
      disable_use_as_direct_query_source = optional(bool)
      disable_use_as_imported_source     = optional(bool)
    }))
    field_folders = optional(list(object({
      columns          = optional(list(string))
      description      = optional(string)
      field_folders_id = string
    })))
    logical_table_map = optional(list(object({
      alias = string
      data_transforms = optional(list(object({
        cast_column_type_operation = optional(object({
          column_name     = string
          format          = optional(string)
          new_column_type = string
        }))
        create_columns_operation = optional(object({
          columns = list(object({
            column_id   = string
            column_name = string
            expression  = string
          }))
        }))
        filter_operation = optional(object({
          condition_expression = string
        }))
        project_operation = optional(object({
          projected_columns = list(string)
        }))
        rename_column_operation = optional(object({
          column_name     = string
          new_column_name = string
        }))
        tag_column_operation = optional(object({
          column_name = string
          tags = list(object({
            column_description = optional(object({
              text = optional(string)
            }))
            column_geographic_role = optional(string)
          }))
        }))
        untag_column_operation = optional(object({
          column_name = string
          tag_names   = list(string)
        }))
      })))
      logical_table_map_id = string
      source = object({
        data_set_arn = optional(string)
        join_instruction = optional(object({
          left_join_key_properties = optional(object({
            unique_key = optional(bool)
          }))
          left_operand = string
          on_clause    = string
          right_join_key_properties = optional(object({
            unique_key = optional(bool)
          }))
          right_operand = string
          type          = string
        }))
        physical_table_id = optional(string)
      })
    })))
    permissions = optional(list(object({
      actions   = set(string)
      principal = string
    })))
    physical_table_map = optional(list(object({
      custom_sql = optional(object({
        columns = optional(list(object({
          name = string
          type = string
        })))
        data_source_arn = string
        name            = string
        sql_query       = string
      }))
      physical_table_map_id = string
      relational_table = optional(object({
        catalog         = optional(string)
        data_source_arn = string
        input_columns = list(object({
          name = string
          type = string
        }))
        name   = string
        schema = optional(string)
      }))
      s3_source = optional(object({
        data_source_arn = string
        input_columns = list(object({
          name = string
          type = string
        }))
        upload_settings = object({
          contains_header = optional(bool)
          delimiter       = optional(string)
          format          = optional(string)
          start_from_row  = optional(number)
          text_qualifier  = optional(string)
        })
      }))
    })))
    refresh_properties = optional(object({
      refresh_configuration = object({
        incremental_refresh = object({
          lookback_window = object({
            column_name = string
            size        = number
            size_unit   = string
          })
        })
      })
    }))
    row_level_permission_data_set = optional(object({
      arn               = string
      format_version    = optional(string)
      namespace         = optional(string)
      permission_policy = string
      status            = optional(string)
    }))
    row_level_permission_tag_configuration = optional(object({
      status = optional(string)
      tag_rules = list(object({
        column_name               = string
        match_all_value           = optional(string)
        tag_key                   = string
        tag_multi_value_delimiter = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.column_groups == null || (length(v.column_groups) <= 8)
      )
    ])
    error_message = "Each column_groups list must contain at most 8 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.field_folders == null || (length(v.field_folders) <= 1000)
      )
    ])
    error_message = "Each field_folders list must contain at most 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.logical_table_map == null || (length(v.logical_table_map) <= 64)
      )
    ])
    error_message = "Each logical_table_map list must contain at most 64 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.logical_table_map == null || alltrue([for item in v.logical_table_map : (item.data_transforms == null || (length(item.data_transforms) <= 2048))])
      )
    ])
    error_message = "Each data_transforms list must contain at most 2048 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.logical_table_map == null || alltrue([for item in v.logical_table_map : (item.data_transforms == null || alltrue([for item in item.data_transforms : (item.create_columns_operation == null || (length(item.create_columns_operation.columns) >= 1 && length(item.create_columns_operation.columns) <= 128))]))])
      )
    ])
    error_message = "Each columns list must contain between 1 and 128 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.logical_table_map == null || alltrue([for item in v.logical_table_map : (item.data_transforms == null || alltrue([for item in item.data_transforms : (item.tag_column_operation == null || (length(item.tag_column_operation.tags) >= 1 && length(item.tag_column_operation.tags) <= 16))]))])
      )
    ])
    error_message = "Each tags list must contain between 1 and 16 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.permissions == null || (length(v.permissions) <= 64)
      )
    ])
    error_message = "Each permissions list must contain at most 64 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.physical_table_map == null || (length(v.physical_table_map) <= 32)
      )
    ])
    error_message = "Each physical_table_map list must contain at most 32 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.physical_table_map == null || alltrue([for item in v.physical_table_map : (item.custom_sql == null || (item.custom_sql.columns == null || (length(item.custom_sql.columns) <= 2048)))])
      )
    ])
    error_message = "Each columns list must contain at most 2048 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.physical_table_map == null || alltrue([for item in v.physical_table_map : (item.relational_table == null || (length(item.relational_table.input_columns) >= 1 && length(item.relational_table.input_columns) <= 2048))])
      )
    ])
    error_message = "Each input_columns list must contain between 1 and 2048 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.physical_table_map == null || alltrue([for item in v.physical_table_map : (item.s3_source == null || (length(item.s3_source.input_columns) >= 1 && length(item.s3_source.input_columns) <= 2048))])
      )
    ])
    error_message = "Each input_columns list must contain between 1 and 2048 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.row_level_permission_tag_configuration == null || (length(v.row_level_permission_tag_configuration.tag_rules) >= 1 && length(v.row_level_permission_tag_configuration.tag_rules) <= 50)
      )
    ])
    error_message = "Each tag_rules list must contain between 1 and 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.column_groups == null || alltrue([for item in v.column_groups : (item.geo_spatial_column_group == null || (alltrue([for x in item.geo_spatial_column_group.columns : length(x) >= 1 && length(x) <= 128])))])
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sets : (
        v.physical_table_map == null || alltrue([for item in v.physical_table_map : (item.s3_source == null || (item.s3_source.upload_settings.start_from_row == null || (item.s3_source.upload_settings.start_from_row >= 1)))])
      )
    ])
    error_message = "must be at least 1"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

