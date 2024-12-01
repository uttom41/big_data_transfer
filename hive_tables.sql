CREATE TABLE IF NOT EXISTS absent_adjustments (id INT, code STRING, employee_leave_id INT, employee_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, own_approval INT, transaction_id INT) PARTITIONED BY (adjustment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS access_tokens (id INT, token STRING, client_id STRING, client_secret STRING, expiry TIMESTAMP, used INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_accesses (id INT, user_id INT, account_id INT, not_accessible TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_all_balances (id INT, account_id INT, center_id INT, amount DECIMAL, account_amount DECIMAL, debit_amount DECIMAL, credit_amount DECIMAL, party_amount DECIMAL, dirty TINYINT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_ancestors (id INT, account_id INT, ancestor_id INT, ancestor_depth INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_balance_update_history (id INT, last_update_time TIMESTAMP, branch_id INT, in_transaction INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_balances (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_balances_by_branch (id INT, account_id INT, branch_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_balances_version_two (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_budgets (id INT, account_id STRING, type INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE, budgeting_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_cost_center_balances (id INT, cost_center_id INT, account_id INT, amount DECIMAL, debit_amount DECIMAL, credit_amount DECIMAL, account_amount DECIMAL, dirty TINYINT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_groups (id INT, account_type STRING, header STRING, group_name STRING, liquidity_order INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, notes STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_opening_balance (id INT, account_id INT, balance_date TIMESTAMP, balance DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_orders (id INT, account_id INT, account_number STRING, `order` INT, depth INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_orders_temp (id INT, account_id INT, depth_0_ancestor_id INT, depth_1_ancestor_id INT, depth_2_ancestor_id INT, depth_3_ancestor_id INT, depth_4_ancestor_id INT, depth_5_ancestor_id INT, depth_6_ancestor_id INT, depth_7_ancestor_id INT, depth_0_ancestor_code STRING, depth_1_ancestor_code STRING, depth_2_ancestor_code STRING, depth_3_ancestor_code STRING, depth_4_ancestor_code STRING, depth_5_ancestor_code STRING, depth_6_ancestor_code STRING, depth_7_ancestor_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_payable_plannings (id INT, vendor_id INT, amount DECIMAL, status INT, cheque_no STRING, bank_id INT, description STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, is_rescheduled TINYINT, voucher_no STRING, parent_id INT, paid INT, order_id INT) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS account_receivable_plannings (id INT, customer_id INT, amount DECIMAL, status INT, cheque_no STRING, bank_id INT, description STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, is_rescheduled TINYINT, voucher_no STRING, parent_id INT, paid INT, order_id INT) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS accounting_dashboard_data (id INT, month STRING, year STRING, sale DECIMAL, cogs DECIMAL, opex DECIMAL, tax DECIMAL, asset DECIMAL, equity DECIMAL, liability DECIMAL, current_ratio DECIMAL, quick_ratio DECIMAL, ar_to_ratio DECIMAL, ap_to_ratio DECIMAL, ccc DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS accounts (id INT, number STRING, name STRING, parent_id INT, type INT, description STRING, note STRING, account_number STRING, inactive TINYINT, deleted TINYINT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, opening_balance DECIMAL, credit_limit DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, bank_id INT, journal_id INT, depth INT, updated_by INT, currency STRING, branch_id INT, center_id INT, account_groups_id INT, project_id INT, back_ref INT, is_approved INT, approved_by INT, approved_at TIMESTAMP) PARTITIONED BY (opening_date DATE, closing_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS activity_actions (id INT, name STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS activity_logs (id INT, user_id INT, url STRING, exact_url STRING, `time` STRING, browser STRING, ip_address STRING, method_request STRING, url_frequency INT, platform STRING, device_type STRING, readable_name STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, end_time STRING, response_time STRING) PARTITIONED BY (`date` DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS adc_statuses (id INT, adc_id INT, script_running TINYINT, device_name STRING, log_time TIMESTAMP, reachable STRING, connected STRING, fetched STRING, posted STRING, destination STRING, created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS additional_charges (id INT, type INT, value DECIMAL, income_acc_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, name STRING, charge_group INT, charge_calculation INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS additional_departments (id INT, additional_department_level_1 INT, additional_department_level_2 INT, additional_department_level_3 INT, additional_department_level_4 INT, additional_department_level_5 INT, additional_department_level_6 INT, additional_department_detail_id_1 INT, additional_department_detail_id_2 INT, additional_department_detail_id_3 INT, additional_department_detail_id_4 INT, additional_department_detail_id_5 INT, additional_department_detail_id_6 INT, employee_id INT, inactive INT, deleted INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS address_outlines (id INT, name STRING, level_1 STRING, level_2 STRING, level_3 STRING, level_4 STRING, level_5 STRING, level_6 STRING, level_7 STRING, level_8 STRING, level_9 STRING, level_10 STRING, view_template STRING, add_template STRING, add_multicolumn_template STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS addresses (id INT, line1 STRING, line2 STRING, line3 STRING, city_id INT, country_id INT, post_code INT, type INT, thana_id INT, area_id INT, post_office INT, division_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS advance_income_tax (id INT, employee_id INT, amount DECIMAL, `date` INT, inactive INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_employee_schedule_histories (id INT, status INT, all_employee_schedule_id INT, voucher_id INT, type INT, amount DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, employee_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_employee_schedules (id INT, employee_id INT, schedule_id INT, salary_amount DECIMAL, bonus_amount DECIMAL, total_amount DECIMAL, total_partial_amount DECIMAL, yearly_amount DECIMAL, reduced_amount DECIMAL, yearly_reduced_amount DECIMAL, tax_exampted_amount DECIMAL, actual_tax_exampted_amount DECIMAL, taxable_amount DECIMAL, actual_taxable_amount DECIMAL, tax_rule_id INT, yearly_tax DECIMAL, monthly_tax DECIMAL, total_leave_deduction_amount DECIMAL, pf_deduction TINYINT, pf_employee_contribution DECIMAL, pf_employer_contribution DECIMAL, adjusted_total_amount DECIMAL, adjusted_total_partial_amount DECIMAL, voucher_id INT, payment_method INT, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted TINYINT, branch_id INT, department_id INT, salary_cost_segment_id INT, bonus_cost_segment_id INT, pf_employer_cost_segment_id INT, pf_employer_from_payroll DECIMAL, subschedule_id INT, cash_amount DECIMAL, bank_amount DECIMAL, due_bank_amount DECIMAL, due_cash_amount DECIMAL, total_revenue_deduction_amount DECIMAL, leave_without_pay_pf_rate DECIMAL) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_employee_schedules_due_amount_histories (id INT, employee_id INT, schedule_id INT, payment_id INT, payment_method INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_payroll_schedules (id INT, name STRING, print_as STRING, frequency_type INT, type INT, status INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, parent_id INT, updated_by INT, deleted TINYINT, branch_id INT, batch_payroll_schedule_id INT) PARTITIONED BY (`start` DATE, `end` DATE, check_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_payscale_data (id INT, payroll_item_id INT, payscale_id INT, payscale_data_id INT, schedule_id INT, employee_schedule_id INT, employee_id INT, amount DECIMAL, partial_amount DECIMAL, yearly_amount DECIMAL, reduced_amount DECIMAL, yearly_reduced_amount DECIMAL, tax_exampted_amount DECIMAL, actual_tax_exampted_amount DECIMAL, taxable_amount DECIMAL, actual_taxable_amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, cost_segment_id INT, payment_method INT, show_in_payslip INT, source_schedule INT, subschedule_id INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS all_products_prices (id INT, product_id INT, code STRING, barcode STRING, base_tp DECIMAL, base_sale_price DECIMAL, effective_sale_price DECIMAL, product_sale_discount DECIMAL, product_sale_discount_2 DECIMAL, promotional_discount DECIMAL, promotional_discount_2 DECIMAL, promotion_id INT, batch_product_price_id INT, customer_category_id INT, membership_card_id INT, branch_id INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT, vendor_id INT, max_mrp DECIMAL, min_mrp DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, promotional_discount_3_percent DECIMAL, promotional_discount_3 DECIMAL, promotional_discount_4_percent DECIMAL, promotional_discount_4 DECIMAL, promotional_discount_5_percent DECIMAL, promotional_discount_5 DECIMAL) PARTITIONED BY (entry_date DATE, effective_date DATE, end_date DATE, start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS alt_price_products (id INT, alt_price_id INT, product_id INT, proforma_product_id INT, quantity DECIMAL, unit_cost DECIMAL, total DECIMAL, created_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS alt_prices (id INT, name STRING, proforma_id INT, description STRING, created_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS alternate_holidays (id INT, employee_id INT, branch_id INT, department_id INT, department_id_2 INT, department_id_3 INT, department_id_4 INT, description STRING, status INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, own_approval INT, transaction_id INT, type INT, leave_type_id INT, leave_id INT) PARTITIONED BY (active_holiday_date DATE, applied_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS aluminium_production_deliveries (id INT, press STRING, shift STRING, operator STRING, start_time STRING, end_time STRING, consumption_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS aluminium_production_inventory_journals (id INT, length DECIMAL, standard_wt_per_kg_feet DECIMAL, standard_wt_per_pcs_kgs DECIMAL, actual_wt_kg_feet DECIMAL, over_less_wt DECIMAL, net_production_wt DECIMAL, wastage DECIMAL, dia_no DECIMAL, qty_pcs DECIMAL, qty_uom DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS aluminium_production_products (id INT, length DECIMAL, standard_wt_per_kg_feet DECIMAL, standard_wt_per_pcs_kgs DECIMAL, actual_wt_kg_feet DECIMAL, over_less_wt DECIMAL, net_production_wt DECIMAL, wastage DECIMAL, dia_no DECIMAL, qty_pcs DECIMAL, qty_uom DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS api_infos (id INT, url STRING, method INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS api_servers (id INT, url STRING, host_name STRING, ip_address STRING, credential STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, method INT, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS api_task_action_histories (id INT, task_id INT, message STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS api_tasks (id INT, code STRING, model STRING, event_id INT, request_data STRING, response_data STRING, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, max_retry INT, is_background INT, sender_id INT, read_service STRING, write_service STRING, retries INT, dao STRING, extra_data STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS api_templates (id INT, template_body STRING, mimetype STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS applications (id INT, app_name STRING, display_name STRING, app_order INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS appraisal_form_histories (id INT, employee_id STRING, outline_id STRING, status INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, transaction_id INT, own_approval INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS appraisal_form_wise_criteria (id INT, criteria_id INT, description STRING, appraisal_form_history_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, allow_self_rating INT, weightage DECIMAL, target STRING, group_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS approval_layers_sla (id INT, approval_layers_id INT, employee_id INT, sla INT, employee_full_name STRING, employee_email STRING, group_id INT, position_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS archive_groups (id INT, name STRING, table_ids STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS archives (id INT, table_name STRING, column_name STRING, total_record INT, created TIMESTAMP) PARTITIONED BY (entry_date DATE, from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS arrear_items (id INT, arrear_id INT, schedule_id INT, payroll_item_id INT, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, payment_method INT, show_in_payslip INT, pf_employee_amount INT, pf_employer_amount INT, pf_deduction_amount INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS arrears (id INT, employee_id INT, type INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, payment_schedule_id INT) PARTITIONED BY (effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assemble_part_degrade_vouchers (id INT, assemble_product_part_id INT, voucher_id INT, product_id INT, quantity DECIMAL, voucher_date TIMESTAMP, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS assemble_part_inventory_products (id INT, assemble_product_part_id INT, inventory_product_id INT, quantity INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS assemble_product_histories (id INT, assemble_product_id INT, product_id INT, description STRING, `date` TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS assemble_product_parts (id INT, assemble_product_id INT, part_product_id INT, serial_number STRING, quantity DECIMAL, last_removed DECIMAL, removed_quantity DECIMAL, status INT, last_change_description STRING, last_change_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS assemble_products (id INT, product_id INT, inventory_id INT, display_name STRING, description STRING, status INT, type INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (assemble_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assembled_product_components (id INT, product_id INT, serial_no STRING, registration_id INT, status INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, template_item_id INT, inventory_id INT, quantity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS assembled_product_registration (id INT, product_bom_id INT, product_id INT, inventory_id INT, target_inventory_id INT, status INT, quantity INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, branch_id INT, code STRING, delivery_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS assembled_product_template (id INT, name STRING, code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS assembled_product_template_items (id INT, template_id INT, item_id INT, product_id INT, quantity DECIMAL, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inventory_id INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS assessment_schedule (id INT, schedule_code STRING, interview_board_id INT, vacancy_id INT, outline_details_id INT, venue STRING, status INT) PARTITIONED BY (result_date DATE, start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assessment_schedule_details (id INT, assessment_schedule_id INT, candidate_id INT, start_time STRING, end_time STRING, inactive INT) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assessments (id INT, title STRING, topic STRING, type INT, inactive INT, campaign_id INT, assessment_lead_id INT, assigned_to INT, branch_id INT, project_id INT, model_type INT, training_requisition_id INT, target_party STRING, description STRING, assessment_number STRING, estimated_outcome DECIMAL, budget DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_assignments (id INT, asset_category_id INT, item_id INT, product_id INT, department_id INT, branch_id INT, party_id INT, serial STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, deleted TINYINT, status TINYINT, commercial_doc_id INT, asset_master_id INT, confirmed TINYINT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, location_level_1 INT, location_level_2 INT, location_level_3 INT, location_level_4 INT, party_type INT) PARTITIONED BY (assign_date DATE, return_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_batches (id INT, batch_no STRING, batch_name STRING, description STRING, fiscal_year INT, quarter_no INT, type INT, posted INT, status INT, product_id INT, voucher_id INT, contra_account_id INT, ar_account_id INT, income_account_id INT, project_id INT, custom_field_1 STRING, day_wise STRING, unit_id INT, branch_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, total_asset_opening_balance DECIMAL, total_asset_adjustment DECIMAL, total_asset_addition DECIMAL, total_asset_depreciation DECIMAL, total_dispose_amount DECIMAL, total_closing DECIMAL, total_opening_depreciation DECIMAL, cost_center_id INT, month INT) PARTITIONED BY (from_date DATE, to_date DATE, apply_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_categories (id INT, name STRING, code STRING, type INT, account_id INT, dep_exp_account_id INT, acc_dep_account_id INT, inventory_id INT, depreciation_policy INT, depreciation_model INT, useful_accounting DECIMAL, useful_tax DECIMAL, useful_mis DECIMAL, depreciation_pulse INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, depreciation_rate DECIMAL, is_vehicle TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_instruction_products (id INT, instruction_id INT, product_id INT, branch_id INT, project_id INT, cost_center_id INT, quantity DECIMAL, opening_balance DECIMAL, depreciation DECIMAL, ref_no STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, account_id INT, dep_account_id INT, item_id INT, asset_master_id INT, asset_category_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_instructions (id INT, label STRING, description STRING, status INT, total_opening_balance DECIMAL, total_depreciation DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, conversion_account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_insurances (id INT, entry_date TIMESTAMP, insurer_id INT, branch_id INT, product_id INT, amount DECIMAL, serial_id INT, receipt_no STRING, contract_ref STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, expiry_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_ledger_unique_products (id INT, asset_ledger_id INT, product_id INT, opening_balance DECIMAL, addition DECIMAL, total DECIMAL, depreciation_rate DECIMAL, depreciation_amount DECIMAL, closing_balance DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, serial STRING, pd_id INT, inactive TINYINT, deleted TINYINT, center_id INT) PARTITIONED BY (till_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_ledgers (id INT, voucher_id INT, account_id INT, asset_category_id INT, opening_balance DECIMAL, addition DECIMAL, depreciation_rate DECIMAL, depreciation_amount DECIMAL, closing_balance DECIMAL, total DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) PARTITIONED BY (till_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_life_extensions (id INT, entry_date TIMESTAMP, product_id INT, serial_id INT, extended_year INT, updated_dep_rate DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, serial_no STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_locations (id INT, asset_management_category_id INT, item_id INT, product_id INT, serial STRING, division STRING, department STRING, party_id INT, section STRING, location STRING, room_no STRING, description STRING, status INT, `current` STRING, branch_id INT, unit_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (assign_date DATE, return_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_management_categories (id INT, name STRING, code STRING, type INT, depreciation_policy INT, depreciation_model INT, useful_accounting DECIMAL, useful_tax DECIMAL, useful_mis DECIMAL, depreciation_pulse INT, depreciation_rate DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted INT, inactive INT, residual_value DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_management_ledgers (id INT, voucher_id INT, product_id INT, asset_serial STRING, asset_product_detail_id INT, delivery_id INT, amount DECIMAL, action_type STRING, total DECIMAL, asset_master_id INT, asset_amount DECIMAL, dep_amount DECIMAL, batch_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, unit_id INT, cost_center_id INT, project_id INT) PARTITIONED BY (tx_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_masters (id INT, account_id INT, inventory_id INT, type STRING, name STRING, description STRING, code STRING, asset_management_category_id INT, depreciation_rate DECIMAL, dep_exp_account_id INT, dep_account_id INT, batch_id INT, updated TIMESTAMP, created TIMESTAMP, updated_by INT, created_by INT, inactive INT, deleted INT, residual_value DECIMAL, branch_id INT, tax_authority_dep_rate DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_details (id INT, asset_batch_id INT, asset_master_id INT, product_id INT, asset_opening_balance DECIMAL, asset_addition DECIMAL, asset_adjustment DECIMAL, asset_closing_balance DECIMAL, dep_opening_balance DECIMAL, dep_adjustment DECIMAL, dep_change DECIMAL, dep_closing_balance DECIMAL, serial STRING, manual_serial STRING, expense_amount DECIMAL, dispose_amount DECIMAL, status INT, inventory_id INT, depreciation_rate DECIMAL, new_asset_balance DECIMAL, new_dep_balance DECIMAL, change_asset_amount DECIMAL, change_dep_amount DECIMAL, warranty_period DECIMAL, duration INT, tender_no STRING, lot_no STRING, package_no STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, unit_id INT, serial_without_prefix STRING, quantity DECIMAL, cost_center_id INT, revaluation_amount DECIMAL, tax_asset_opening_balance DECIMAL, tax_asset_closing_balance DECIMAL, tax_asset_dep_rate DECIMAL, tax_dep_opening_balance DECIMAL, tax_dep_closing_balance DECIMAL, tax_dep_adjustment DECIMAL) PARTITIONED BY (till_date DATE, warranty_start DATE, warranty_end DATE, from_date DATE, to_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_summaries (id INT, batch_id INT, asset_master_id INT, product_id INT, asset_opening_balance DECIMAL, asset_addition DECIMAL, asset_adjustment DECIMAL, asset_closing_balance DECIMAL, dep_opening_balance DECIMAL, dep_adjustment DECIMAL, dep_change DECIMAL, dep_closing_balance DECIMAL, serial STRING, manual_serial STRING, expense_amount DECIMAL, dispose_amount DECIMAL, status INT, inventory_id INT, depreciation_rate DECIMAL, new_asset_balance DECIMAL, new_dep_balance DECIMAL, change_asset_amount DECIMAL, change_dep_amount DECIMAL, warranty_period DECIMAL, duration INT, tender_no STRING, lot_no STRING, package_no STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, unit_id INT, branch_id INT, quantity DECIMAL, assigned TINYINT, cost_center_id INT, project_id INT, converted_to_inventory INT) PARTITIONED BY (till_date DATE, warranty_start DATE, warranty_end DATE, from_date DATE, to_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_summary_actions (id INT, asset_product_summary_id INT, product_id INT, serial STRING, status INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_repairs (id INT, code STRING, unit_id INT, branch_id INT, product_id INT, serial STRING, warranty_period DECIMAL, tender_no STRING, lot_no STRING, package_no STRING, vendor STRING, cost DECIMAL, status STRING, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (warranty_start DATE, warranty_end DATE, sending_date DATE, return_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assets (id INT, account_id INT, asset DECIMAL, contra_asset DECIMAL, name STRING, description STRING, paid_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS attachments (id INT, table_name STRING, table_key INT, upload_name STRING, title STRING, description STRING, type INT, default TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance (id BIGINT, employee_id INT, shift_id INT, branch_id INT, department_id INT, designation_id INT, in_out STRING, in_out_buyer_view STRING, odd_entry TINYINT, leave_type_id INT, taken_days DECIMAL, deduction_amount DECIMAL, holiday_policy_id INT, holiday TINYINT, present_hour DECIMAL, present_hour_buyer_view DECIMAL, working_hour DECIMAL, working_hour_buyer_view DECIMAL, absent TINYINT, short_duration TINYINT, short_presence TINYINT, late TINYINT, late_hour DECIMAL, over_time DECIMAL, over_time_buyer_view DECIMAL, extra_over_time DECIMAL, extra_over_time_buyer_view DECIMAL, raw_over_time DECIMAL, raw_extra_over_time DECIMAL, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, early_out_hour DECIMAL, night_shift INT, replacement_leave INT, movement_register_id INT, wfh INT, special_holiday INT, weekends INT, actual_ot DECIMAL) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_adjustment_reason (id INT, title STRING, message STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_buffer (id INT, employee_id INT, card_id STRING, machine_id STRING, method INT, created TIMESTAMP, in_time STRING, out_time STRING, original_entry_time STRING, entry_time STRING, deleted TINYINT, posted TINYINT, wfh INT, dirty INT, updated TIMESTAMP, created_by INT, updated_by INT, status INT) PARTITIONED BY (in_date DATE, out_date DATE, entry_date DATE, original_entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_calculation_config (id INT, type INT, name STRING, slabs STRING, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_clients (id INT, name STRING, client_address STRING, client_server_app STRING, reporting_interval INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_data (id BIGINT, employee_id INT, card_id STRING, machine_id STRING, method INT, created TIMESTAMP, entry_time STRING, original_entry_time STRING, deleted TINYINT, posted TINYINT, wfh INT, dirty INT, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE, original_entry_date DATE) STORED AS ORC