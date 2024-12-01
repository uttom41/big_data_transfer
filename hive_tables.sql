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

CREATE TABLE IF NOT EXISTS all_employee_schedules (id INT, employee_id INT, schedule_id INT, salary_amount DECIMAL, bonus_amount DECIMAL, total_amount DECIMAL, total_partial_amount DECIMAL, yearly_amount DECIMAL, reduced_amount DECIMAL, yearly_reduced_amount DECIMAL, tax_exampted_amount DECIMAL, actual_tax_exampted_amount DECIMAL, taxable_amount DECIMAL, actual_taxable_amount DECIMAL, tax_rule_id INT, yearly_tax DECIMAL, monthly_tax DECIMAL, total_leave_deduction_amount DECIMAL, pf_deduction TINYINT, pf_employee_contribution DECIMAL, pf_employer_contribution DECIMAL, adjusted_total_amount DECIMAL, adjusted_total_partial_amount DECIMAL, voucher_id INT, payment_method INT, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted TINYINT, branch_id INT, department_id INT, salary_cost_segment_id INT, bonus_cost_segment_id INT, pf_employer_cost_segment_id INT, pf_employer_from_payroll DECIMAL, subschedule_id INT, cash_amount DECIMAL, bank_amount DECIMAL, due_bank_amount DECIMAL, due_cash_amount DECIMAL, total_revenue_deduction_amount DECIMAL, leave_without_pay_pf_rate DECIMAL, tax_segment_id INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

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

CREATE TABLE IF NOT EXISTS api_tasks (id INT, code STRING, model STRING, event_id INT, request_data STRING, response_data STRING, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, max_retry INT, is_background INT, sender_id INT, read_service STRING, write_service STRING, retries INT, dao STRING, extra_data STRING, resp_status_code INT) STORED AS ORC

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

CREATE TABLE IF NOT EXISTS asset_life_extensions (id INT, entry_date TIMESTAMP, product_id INT, serial_id INT, extended_year INT, updated_dep_rate DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_locations (id INT, asset_management_category_id INT, item_id INT, product_id INT, serial STRING, division STRING, department STRING, party_id INT, section STRING, location STRING, room_no STRING, description STRING, status INT, `current` STRING, branch_id INT, unit_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (assign_date DATE, return_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_management_categories (id INT, name STRING, code STRING, type INT, depreciation_policy INT, depreciation_model INT, useful_accounting DECIMAL, useful_tax DECIMAL, useful_mis DECIMAL, depreciation_pulse INT, depreciation_rate DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted INT, inactive INT, residual_value DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_management_ledgers (id INT, voucher_id INT, product_id INT, asset_serial STRING, asset_product_detail_id INT, delivery_id INT, amount DECIMAL, action_type STRING, total DECIMAL, asset_master_id INT, asset_amount DECIMAL, dep_amount DECIMAL, batch_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, unit_id INT, cost_center_id INT, project_id INT) PARTITIONED BY (tx_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_masters (id INT, account_id INT, inventory_id INT, type STRING, name STRING, description STRING, code STRING, asset_management_category_id INT, depreciation_rate DECIMAL, dep_exp_account_id INT, dep_account_id INT, batch_id INT, updated TIMESTAMP, created TIMESTAMP, updated_by INT, created_by INT, inactive INT, deleted INT, residual_value DECIMAL, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_details (id INT, asset_batch_id INT, asset_master_id INT, product_id INT, asset_opening_balance DECIMAL, asset_addition DECIMAL, asset_adjustment DECIMAL, asset_closing_balance DECIMAL, dep_opening_balance DECIMAL, dep_adjustment DECIMAL, dep_change DECIMAL, dep_closing_balance DECIMAL, serial STRING, manual_serial STRING, expense_amount DECIMAL, dispose_amount DECIMAL, status INT, inventory_id INT, depreciation_rate DECIMAL, new_asset_balance DECIMAL, new_dep_balance DECIMAL, change_asset_amount DECIMAL, change_dep_amount DECIMAL, warranty_period DECIMAL, duration INT, tender_no STRING, lot_no STRING, package_no STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, unit_id INT, serial_without_prefix STRING, quantity DECIMAL, cost_center_id INT, revaluation_amount DECIMAL, tax_asset_opening_balance DECIMAL, tax_asset_closing_balance DECIMAL, tax_asset_dep_rate DECIMAL, tax_dep_opening_balance DECIMAL, tax_dep_closing_balance DECIMAL, tax_dep_adjustment DECIMAL) PARTITIONED BY (till_date DATE, warranty_start DATE, warranty_end DATE, from_date DATE, to_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_summaries (id INT, batch_id INT, asset_master_id INT, product_id INT, asset_opening_balance DECIMAL, asset_addition DECIMAL, asset_adjustment DECIMAL, asset_closing_balance DECIMAL, dep_opening_balance DECIMAL, dep_adjustment DECIMAL, dep_change DECIMAL, dep_closing_balance DECIMAL, serial STRING, manual_serial STRING, expense_amount DECIMAL, dispose_amount DECIMAL, status INT, inventory_id INT, depreciation_rate DECIMAL, new_asset_balance DECIMAL, new_dep_balance DECIMAL, change_asset_amount DECIMAL, change_dep_amount DECIMAL, warranty_period DECIMAL, duration INT, tender_no STRING, lot_no STRING, package_no STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, unit_id INT, branch_id INT, quantity DECIMAL, assigned TINYINT, cost_center_id INT, project_id INT, converted_to_inventory INT) PARTITIONED BY (till_date DATE, warranty_start DATE, warranty_end DATE, from_date DATE, to_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_product_summary_actions (id INT, asset_product_summary_id INT, product_id INT, serial STRING, status INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS asset_repairs (id INT, code STRING, unit_id INT, branch_id INT, product_id INT, serial STRING, warranty_period DECIMAL, tender_no STRING, lot_no STRING, package_no STRING, vendor STRING, cost DECIMAL, status STRING, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (warranty_start DATE, warranty_end DATE, sending_date DATE, return_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS assets (id INT, account_id INT, asset DECIMAL, contra_asset DECIMAL, name STRING, description STRING, paid_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS assigned_rent_free_products (id INT, inventory_id INT, product_id INT, party_id INT, quantity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS attachments (id INT, table_name STRING, table_key INT, upload_name STRING, title STRING, description STRING, type INT, default TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance (id BIGINT, employee_id INT, shift_id INT, branch_id INT, department_id INT, designation_id INT, in_out STRING, in_out_buyer_view STRING, odd_entry TINYINT, leave_type_id INT, taken_days DECIMAL, deduction_amount DECIMAL, holiday_policy_id INT, holiday TINYINT, present_hour DECIMAL, present_hour_buyer_view DECIMAL, working_hour DECIMAL, working_hour_buyer_view DECIMAL, absent TINYINT, short_duration TINYINT, short_presence TINYINT, late TINYINT, late_hour DECIMAL, over_time DECIMAL, over_time_buyer_view DECIMAL, extra_over_time DECIMAL, extra_over_time_buyer_view DECIMAL, raw_over_time DECIMAL, raw_extra_over_time DECIMAL, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, early_out_hour DECIMAL, special_holiday INT, weekends INT, night_shift INT, replacement_leave INT, movement_register_id INT, wfh INT, actual_ot DECIMAL) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_adjustment_reason (id INT, title STRING, message STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_buffer (id INT, employee_id INT, card_id STRING, machine_id STRING, method INT, created TIMESTAMP, in_time STRING, out_time STRING, original_entry_time STRING, entry_time STRING, deleted TINYINT, posted TINYINT, wfh INT, dirty INT, updated TIMESTAMP, created_by INT, updated_by INT, status INT) PARTITIONED BY (in_date DATE, out_date DATE, entry_date DATE, original_entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_calculation_config (id INT, type INT, name STRING, slabs STRING, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_clients (id INT, name STRING, client_address STRING, client_server_app STRING, reporting_interval INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_data (id BIGINT, employee_id INT, card_id STRING, machine_id STRING, method INT, created TIMESTAMP, entry_time STRING, original_entry_time STRING, deleted TINYINT, posted TINYINT, wfh INT, dirty INT, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE, original_entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_data_raw (id INT, card_id STRING, machine_id STRING, created TIMESTAMP, entry_time STRING, deleted INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_device_data_raw_filter (id INT, card_id STRING, machine_id STRING, created TIMESTAMP, entry_time STRING, deleted INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_late_in_early_out_consumption_policies (id INT, late_consumption_method INT, late_absent_deduction_count_ratio DECIMAL, full_present_cancel_limit DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_late_in_early_out_consumption_policy_details (id INT, consumption_policy_id INT, `order` INT, consumption_type_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_leave_config_slabs (id INT, percentage DECIMAL, absent_from INT, absent_to INT, absent_leave_from INT, absent_leave_to INT, leave_from INT, leave_to INT, holiday_from INT, holiday_to INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, payscale_data_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_schedule_items (id INT, employee_id INT, attendance_schedule_id INT, working_days DECIMAL, present_days DECIMAL, absent_days DECIMAL, late_absent_days DECIMAL, late_hour DECIMAL, total_hour DECIMAL, working_hour DECIMAL, raw_over_time_hour DECIMAL, raw_extra_over_time_hour DECIMAL, over_time_hour DECIMAL, extra_over_time_hour DECIMAL, leave_count DECIMAL, leave_wop_count DECIMAL, total_leave_deduction_amount DECIMAL, full_present INT, piece INT, total_piecework_amount DECIMAL, over_piece INT, present_in_holiday DECIMAL, piece_work_days INT, no_job_days INT, eot_days INT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT, inactive INT, deleted INT, early_out_hour DECIMAL, odd_entry_absent_days INT, early_out_absent_days INT, odd_entry_days INT, early_out_days INT, late_days INT, wfh_days DECIMAL, short_leave_days INT, movement_register_count INT, actual_absent_days DECIMAL, requisition_ot_hour DECIMAL, holidays_ot_hour DECIMAL, total_employee_holiday DECIMAL, maternity_leave_days DECIMAL, requisition_ot_hour_two DECIMAL, requisition_ot_hour_four DECIMAL, suspension_days DECIMAL, absent_considering_suspension_days DECIMAL, pms_percentage DECIMAL, sales_based_basic_percentage DECIMAL, sales_incentive_percentage DECIMAL, leave_encashment_amount DECIMAL, sales_count DECIMAL, leave_count_without_el DECIMAL, employee_deposit_amount DECIMAL, employee_sales_force_kpi DECIMAL) PARTITIONED BY (maternity_leave_start DATE, maternity_leave_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_schedules (id INT, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, status INT, own_approval INT, transaction_id INT, branch_id STRING, all_payroll_schedule_id STRING, dept_level_1 STRING, dept_level_2 STRING, dept_level_3 STRING, dept_level_4 STRING, job_location_id STRING, cost_center_id INT, employee_ids STRING, paygrade_id STRING, designation_id STRING, employment_type_id STRING, employee_level_id STRING, field_force INT, paygrade_level_id STRING, salary_location_id STRING, department_hierarchy STRING, dept_level_5 STRING, dept_level_6 STRING, leave_data STRING) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attendance_status (verified TINYINT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, created_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS attorneys (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, employee_id INT, blood_group STRING, gender INT, nid STRING, age STRING, phone STRING, birth_certificate_number STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_group (id INT, name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_group_permissions (id INT, group_id INT, permission_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_permission (id INT, name STRING, content_type_id INT, codename STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_user (id INT, password STRING, last_login TIMESTAMP, is_superuser TINYINT, username STRING, first_name STRING, last_name STRING, email STRING, is_staff TINYINT, is_active TINYINT, date_joined TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_user_groups (id INT, user_id INT, group_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS auth_user_user_permissions (id INT, user_id INT, permission_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS `authorization` (id INT, appname STRING, client_id STRING, client_secret STRING, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, user_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS background_tasks (id INT, code STRING, redirect_to STRING, status INT, progress DECIMAL, message STRING, error_msg STRING, user_id INT, title STRING, created TIMESTAMP, thread_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bank_branches (id INT, name STRING, tracking_number STRING, bank_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, address_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bank_emis (id INT, bank_id INT, tenure INT, name STRING, charge_percent DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS bank_forwardings (id INT, name STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bank_schedule_data (id INT, employee_id INT, account_id INT, schedule_id INT, amount DECIMAL, ta_da_amount DECIMAL, total DECIMAL, reference_number STRING, status INT, updated TIMESTAMP, updated_by INT, created_by INT, created TIMESTAMP) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS bank_transactions (id INT, ledger_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (bank_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS banks (id INT, status INT, back_ref INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS batch_bookings (id INT, product_id INT, barcode STRING, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, inventory_id INT, quantity DECIMAL, status INT, batch_no STRING, order_id INT, doc_type_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, from_pipe_line INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS batch_payroll_schedules (id INT, year STRING, month STRING, branch_id_list STRING, payroll_schedule_id_list STRING, status INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, dept_level_1 STRING, dept_level_2 STRING, dept_level_3 STRING, dept_level_4 STRING, job_location_id STRING, designation_id STRING, employment_type_id STRING, employee_level_id STRING, field_force INT, paygrade_id STRING, paygrade_level_id STRING, salary_location_id STRING, dept_level_5 STRING, dept_level_6 STRING, department_hierarchy STRING, name STRING) PARTITIONED BY (`start` DATE, `end` DATE, payment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS batch_product_prices (id INT, name STRING, status INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT, branch_id INT, code STRING, applied_branch_id INT, change_type INT, change_percentage DECIMAL, customer_category_id INT, type INT) PARTITIONED BY (effective_date DATE, start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS batch_wise_promotion (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, promotion_type INT, promo_code STRING, status INT, applied_branch_id INT, sub_category_id INT, sub_category_2_id INT, sub_category_3_id INT, sub_category_4_id INT, discount_percent DECIMAL, discount DECIMAL, supp_discount_percent DECIMAL, supp_discount DECIMAL, customer_category_id INT, payment_method INT, vendor_promo_applicable_on INT, payment_method_cash INT, payment_method_credit INT, payment_method_cash_and_card INT, payment_method_emi INT, payment_method_card INT, batch_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS batch_wise_promotion_products (id INT, promotion_id INT, item_id INT, product_id INT, promotional_price DECIMAL, promotional_discount DECIMAL, promotional_discount_percent DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, promotional_special_discount DECIMAL, promotional_special_discount_percent DECIMAL, promotional_general_discount DECIMAL, promotional_general_discount_percent DECIMAL, branch_id INT, sub_category_id INT, code STRING, barcode STRING, product_sale_discount DECIMAL, product_sale_discount_2 DECIMAL, base_tp DECIMAL, base_sale_price DECIMAL, product_sale_discount_percent DECIMAL, vendor_id INT, min_quantity DECIMAL, max_quantity DECIMAL, is_recurrent DECIMAL, batch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bill_claim_items (id INT, bill_claim_purpose_id INT, description STRING, amount DECIMAL, commercial_doc_id INT, sanctioned_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS bill_claim_purposes (id INT, name STRING, description STRING, expense INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS bill_disburse_items (id INT, bill_claim_purpose_id INT, description STRING, amount DECIMAL, commercial_doc_id INT, bill_claim_id INT, sanctioned_amount DECIMAL, payment DECIMAL, bill_claim_item_id INT, remaining_amount DECIMAL, emp_account_number STRING, bank_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS billingcycles (id INT, name STRING, duration INT, description STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bond_consumption_items (id INT, bond_cons_id INT, style_id INT, bond_item_id INT, bond_no STRING, bond_year INT, product_id INT, quantity DECIMAL, remarks STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bond_consumptions (id INT, con_no STRING, branch_id INT, invoice_no STRING, pl_no STRING, exp_no STRING, dc_no STRING, be_no STRING, ep_no STRING, sappho_no STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT) PARTITIONED BY (con_date DATE, invoice_date DATE, pl_date DATE, exp_date DATE, dc_date DATE, be_date DATE, ep_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS bond_finishedgoods_items (id INT, style_id INT, style_code STRING, bond_cons_id INT, quantity DECIMAL, weight_kg DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bond_items (id INT, bond_id INT, product_id INT, product_code STRING, currency STRING, rate DECIMAL, quantity DECIMAL, amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bond_ledgers (id INT, bond_id INT, year INT, consumption_id INT, party_id INT, invoice_no STRING, ip_no STRING, product_id INT, imp_qnty DECIMAL, con_qnty DECIMAL, quantity DECIMAL, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (entry_date DATE, invoice_date DATE, ip_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS bonds (id INT, bond_no STRING, year INT, status INT, invoice_no STRING, be_no STRING, bl_no STRING, lc_no STRING, pi_no STRING, ip_no STRING, delivery_id STRING, supplier_id INT, import_value DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) PARTITIONED BY (entry_date DATE, invoice_date DATE, be_date DATE, bl_date DATE, lc_date DATE, pi_date DATE, ip_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS bonus (id INT, name STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bonus_details (id INT, bonus_id INT, department_id INT, designation_id INT, employment_type INT, calculation_on INT, percentage DECIMAL, minimum_amount DECIMAL, service_months_from DECIMAL, service_months_to DECIMAL, gender INT, religion_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, calc_period_policy INT, service_days_from INT, service_days_to INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS bookings (id INT, expected_date TIMESTAMP, total_hours DECIMAL, total_quantity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS boq_categories (id INT, name STRING, code STRING, depth INT, parent_id INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS boq_item_wise_cached_balance (id INT, project_id INT, boq_id INT, boq_item_id INT, product_id INT, total_budget_qty INT, total_requisition_qty INT, total_purchase_invoice_qty INT, total_delivery_out_qty INT, total_purchase_request_qty INT, total_purchase_order_qty INT, total_purchase_delivery_qty INT, unit_cost DECIMAL, total_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS boq_item_wise_documents (id INT, project_id INT, boq_id INT, boq_item_id INT, product_id INT, doc_type INT, doc_id INT, doc_item_id INT, status INT, quantity INT, amount INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS boq_template (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS boq_template_items (id INT, template_id INT, boq_category_id INT, boq_sub_category_id INT, budget_item_id INT, product_id INT, budget_item_account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branch_ancestors (id INT, branch_id INT, parent_id INT, depth INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branch_wise_default_data (id INT, branch_id INT, cogs_account_id INT, cash_account_id INT, payable_account_id INT, receivable_account_id INT, inventory_account_id INT, income_account_id INT, goods_receivable_account_id INT, inventory_id INT, inactive INT, deleted INT, discount_gain_account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branch_wise_product_active_inactive_status (id INT, branch_id INT, product_id INT, inactive INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branch_wise_product_prices (id INT, product_id INT, price DECIMAL, currency_id INT, branch_id INT, type INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branch_wise_product_prices_history (id INT, product_id INT, price DECIMAL, currency_id INT, branch_id INT, type INT, start_date TIMESTAMP, end_date TIMESTAMP, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS branches (id INT, employee_id INT, region_id INT, description STRING, full_name STRING, print_as STRING, code STRING, registration_no STRING, website STRING, phone STRING, alt_phone STRING, fax STRING, email STRING, alt_email STRING, mobile STRING, alt_mobile STRING, address_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by STRING, updated TIMESTAMP, gstin STRING, parent_id INT, rank INT, longitude DECIMAL, latitude DECIMAL, dms_branch_name STRING, dms_branch_code STRING) PARTITIONED BY (`start` DATE, `end` DATE, founded DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS branchwise_default_cash_account (id INT, branch_id INT, account_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_prefix STRING, serial_start INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS brta_application_others (id INT, name STRING, type INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS brta_applications (id INT, name STRING, father_name STRING, address STRING, phone_no STRING, nationality STRING, gurdian_name STRING, serial_1 STRING, serial_2 STRING, year_of_mfg STRING, previous_reg_no STRING, p_o_bank STRING, sex INT, joint_bank STRING, owner_type STRING, hire STRING, hire_purchase STRING, product_id INT, class_of_vehicle STRING, maker_name STRING, type_of_body STRING, maker_country_id INT, colour STRING, number_of_cylinder STRING, fuel_use STRING, horse_power_id INT, rpm_id INT, cubic_capacity_id INT, seat STRING, no_of_standee STRING, wheel_base_id INT, laden_weight_id INT, max_laden_weight_id INT, no_of_tyres STRING, tyres_id INT, no_of_axle STRING, max_axle_weight STRING, overall_length_id INT, overall_width_id INT, overall_height_id INT, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT, branch_id INT, model_name STRING) PARTITIONED BY (date_of_birth DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_account_summary (id INT, budget_id INT, account_id INT, account_type INT, amount DECIMAL, parent_id INT, level_id INT, created_by INT, updated_by INT, approved_by INT, created TIMESTAMP, updated TIMESTAMP, approved_date TIMESTAMP, status INT, deleted INT, inactive INT, description STRING, distribution_id INT, receive_work_order_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_consumptions_info (id INT, voucher_id INT, project_id INT, budget_id INT, budget_item_id INT, account_id INT, expense INT, created TIMESTAMP, updated TIMESTAMP, is_approved INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_distribution_methods (id INT, name STRING, duration INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive INT, deleted INT, for_target_setup INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_distribution_sections (id INT, distribution_id INT, section_name STRING, ratio DECIMAL, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_item_wise_consumptions_summary (id INT, source_id INT, budget_id INT, branch_id INT, category_id INT, sub_category_id INT, budget_item_id INT, total_budget INT, total_expense INT, prev_status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_scenario_accounts (id INT, budget_scenario_id INT, account_id INT, account_type INT, created_by INT, updated_by INT, approved_by INT, created TIMESTAMP, updated TIMESTAMP, approved_date TIMESTAMP, status INT, deleted INT, inactive INT, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS budget_scenarios (id INT, scenario_name STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS budgets (id INT, budget_id INT, order_count INT, amount DECIMAL) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_additional_info (id INT, loan_id INT, penalty_rate DECIMAL, commission DECIMAL, loan_purpose INT, time_limit INT, credit_limit DECIMAL, local_foreign INT, currency STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (loan_expiry_date DATE, loan_disbursement_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_histories (id INT, name STRING, number STRING, term INT, loan_id INT, amount DECIMAL, interest_type INT, interest_rate DECIMAL, installment_amount DECIMAL, bank_id INT, frequency INT, tenure INT, account_id INT, contra_account_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, processing_fee_voucher_id INT, processing_fee DECIMAL, type STRING) PARTITIONED BY (loan_issue_date DATE, repayment_start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_payment_vouchers (id INT, loan_id INT, voucher_id INT, payment_category INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, total_payment DECIMAL, principal DECIMAL, monthly_interest DECIMAL, balance DECIMAL, emi_schedule_id INT) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_purposes (id INT, purpose STRING, print_as STRING, index INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_receive_vouchers (id INT, loan_id INT, voucher_id INT, base_or_extend INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loan_types (id INT, name STRING, print_as STRING, category INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS business_loans (id INT, name STRING, number STRING, term INT, type_id INT, amount DECIMAL, interest_type INT, interest_rate DECIMAL, bank_id INT, frequency INT, tenure INT, account_id INT, contra_account_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, installment_amount DECIMAL, processing_fee DECIMAL, doc_id INT, party_id INT, interest_account_id INT) PARTITIONED BY (loan_issue_date DATE, repayment_start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cached_account_balances (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cached_budget_item_wise_consumptions (id INT, project_id INT, budget_id INT, budget_item_id INT, total_budget INT, total_expense INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS call_log (id INT, call_type INT, direction INT, phone_number STRING, email STRING, address STRING, appointment_set INT, notes STRING, comments STRING, person STRING, feedback INT, contact_id INT, designation STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS calls (id INT, start_time STRING, end_time STRING, call_number STRING, related_to STRING, related_to_show STRING, call_subject STRING, description STRING, direction STRING, duration STRING, hours INT, minutes INT, modified_by INT, schedule_call_subject STRING, status INT, assigned_to INT, created_by INT, call_type INT, phone_type STRING, party_type INT, party_id INT) PARTITIONED BY (date_created DATE, end_date DATE, reminder DATE, schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS campaign_objective_types (id INT, campaign_id INT, objective_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS campaign_organization (id INT, campaign_id INT, organization_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS campaign_place (id INT, campaign_id INT, address STRING, campaign_owner_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS campaign_terms_conditions (id INT, campaign_id INT, terms_conditions STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS campaigns (id INT, name STRING, type INT, currency STRING, budget DECIMAL, expected_revenue DECIMAL, objective STRING, description STRING, status INT, impression STRING, actual_cost DECIMAL, expected_cost DECIMAL, assign_to INT, team_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS candidate_assessment_details (id INT, assessment_id INT, interviewer_id INT, marks DECIMAL, wightage_percent DECIMAL, weightage_marks DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS candidate_assessments (id INT, schedule_id INT, vacancy_id INT, candidate_id INT, pannel_id INT, step_id INT, total_marks DECIMAL, full_marks DECIMAL, wieghtage_marks DECIMAL, weightage_max_marks DECIMAL, recommended_by INT, approved_by INT, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`date` DATE, recommended_date DATE, approved_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS candidate_positions (id INT, candidate_id INT, vacancy_id INT, status INT, note STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS candidate_qualifications (id INT, type INT, party_id INT, degree_level INT, trained_level INT, degree_name STRING, training_name STRING, company_name STRING, passing_year INT, position STRING, duration_in_year INT, duration_in_month INT, duration_in_days INT, duration_in_hr INT, major_subject STRING, result STRING, board_university STRING, certificate_authority STRING, responsibilities STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS candidates (id INT, code STRING, vacancy_id INT, source_id INT, status INT, current_designation STRING, current_company STRING, current_salary DECIMAL, expected_salary DECIMAL, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, custom_field_6 STRING, custom_field_7 STRING, custom_field_8 STRING, custom_field_9 STRING, custom_field_10 STRING, note STRING, provision_period INT, appraisal_duration INT, holiday_policy_id INT, leave_policy_id INT, shift_schedule_id INT, payscale_id INT, schedule_id INT, salary_amount DECIMAL, manager_1 INT, manager_2 INT, employee_id INT, employment_type INT, confirmed_salary DECIMAL, marks_obtained DECIMAL, grade_id INT) PARTITIONED BY (application_date DATE, next_appraisal_date DATE, `start` DATE, confirmation_date DATE, employee_start DATE, recruitment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS card_device_charges (id INT, card_device_id INT, card_type_id INT, charge DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS card_devices (id INT, name STRING, account_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, branch_id INT, hide_card_number_input INT, hide_card_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cargo_service_commodities (id INT, name STRING, label STRING, created_by INT, updated_by INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS categories (id INT, category_name STRING, print_as STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS center_wise_salary_percentage (id INT, employee_id INT, center_id INT, `start` TIMESTAMP, `end` TIMESTAMP, percentage DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cheque_book_leafs (id INT, cheque_number STRING, cheque_book_id INT, status INT, voucher_id INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, party_id INT, description STRING) PARTITIONED BY (issue_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cheque_books (id INT, cheque_book_no STRING, account_id INT, bank_id INT, branch_id INT, first_cheque_no INT, number_of_leafs INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, leaf_prefix STRING) PARTITIONED BY (issue_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cheque_status_histories (id INT, cheque_id INT, voucher_id INT, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (transaction_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cheques (id INT, cheque_number STRING, account_number STRING, amount DECIMAL, party_id INT, bank_id INT, created_by INT, updated_by INT, journal_id INT, account_id INT, type INT, account_name STRING, voucher_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, branch_id INT, cheque_account_id INT, receipt_no STRING, model_id INT, sales_person_1 INT, description STRING, branch STRING, is_order_paid TINYINT, cheque_book_id INT, cheque_book_leaf_id INT, receipt_book_id INT, receipt_book_leaf_id INT, project_id INT, commercial_doc_id INT, cost_center_id INT) PARTITIONED BY (issue_date DATE, valid_up_to DATE, clear_date DATE, cancel_date DATE, receive_date DATE, new_issue_date DATE, handover_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ckd_document_serials (id INT, ckd_document_id INT, serial_1 STRING, serial_2 STRING, color STRING, tracking_no STRING, invoice_no STRING, invoice_date STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS ckd_documents (id INT, ckd_number STRING, ckd_ref_no STRING, file_url STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS claim_problems (id INT, warranty_claim_id INT, problem_id INT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS claim_related_problems (id INT, problem_name STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS claim_vouchers (id INT, voucher_id INT, claim_id INT, voucher_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cnf_agents (id INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_adjustment_delivery_items (id INT, cold_storage_delivery_id INT, dolil_id INT, booking_id INT, advance DECIMAL, adjust TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, voucher_id INT, accepted TINYINT, sr_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_bag_delivery_items (id INT, cold_storage_delivery_id INT, sale_order_id INT, voucher_number STRING, amount DECIMAL, paid_amount DECIMAL, due_amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, quantity INT, unit_cost DECIMAL, total_amount DECIMAL, accepted TINYINT, original_quantity INT) PARTITIONED BY (bag_delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_blacklist (id INT, blacklist_no STRING, sr_id INT, party_id INT, applier_name STRING, applier_contact_no STRING, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING) PARTITIONED BY (blacklist_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_booking_items (id INT, booking_id INT, product_id INT, quantity DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, item_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_bookings (id INT, agent_id INT, party_id INT, total_quantity DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, booking_no STRING, status INT, advance DECIMAL, account_id INT, contra_account_id INT, voucher_id INT, adjusted TINYINT, reference_booking INT) PARTITIONED BY (booking_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_deliveries (id INT, dolil_id INT, party_id INT, total DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, status INT, delivery_no STRING, inventory_id INT, total_loan DECIMAL, account_id INT, contra_account_id INT, voucher_id INT, total_bag DECIMAL, bag_voucher_id INT, sr_id INT, total_carry DECIMAL, completed_by INT, completed_time TIMESTAMP, description STRING, serial INT) PARTITIONED BY (delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_delivery_carrying_info (id INT, cold_storage_delivery_id INT, sr_id INT, carrying_amount DECIMAL, interest_rate DECIMAL, paid_amount DECIMAL, interest DECIMAL, total DECIMAL, accepted TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_delivery_items (id INT, cold_storage_delivery_id INT, sr_id INT, product_id INT, floor_id INT, room_id INT, pocket_id INT, quantity INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, unit_cost DECIMAL, total_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_dolil_items (id INT, dolil_id INT, product_id INT, unit_cost DECIMAL, quantity DECIMAL, total DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_dolils (id INT, dolil_no STRING, party_id INT, sr_id INT, via STRING, agent_id INT, bag_delivery_ref_id INT, bag_qty DECIMAL, total DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT) PARTITIONED BY (dolil_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_floors (id INT, floor_no STRING, updated TIMESTAMP, updated_by INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_inventories (id INT, name STRING, address_id INT, type INT, inventory_type INT, account_id INT, updated TIMESTAMP, updated_by INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT, description STRING, branch_id INT, index INT, wastage_kpi INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_inventory_journal_histories (id INT, product_id INT, cold_storage_inventory_id INT, delivery_id INT, status TINYINT, sr_id INT, quantity DECIMAL, room_id INT, floor_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, dolil_id INT, pocket_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_inventory_journals (id INT, product_id INT, cold_storage_inventory_id INT, delivery_id INT, status TINYINT, sr_id INT, quantity DECIMAL, room_id INT, floor_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, dolil_id INT, pocket_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_loan_purposes (id INT, name STRING, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_loan_receive (id INT, voucher_id INT, cold_storage_delivery_id INT, loan_type INT, loan_amount DECIMAL, days INT, interest_rate DECIMAL, paid_amount DECIMAL, interest DECIMAL, total_loan_amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, accepted TINYINT, party_id INT, receive_voucher_id INT, payment_method_type INT, account_id INT, contra_account_id INT) PARTITIONED BY (from_date DATE, to_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_loan_srs (id INT, loan_voucher_id INT, sr_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_pockets (id INT, pocket_no STRING, room_id INT, floor_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_receive_loan_srs (id INT, receive_loan_voucher_id INT, sr_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_rooms (id INT, room_no STRING, floor_id INT, updated TIMESTAMP, updated_by INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_sr_items (id INT, product_id INT, quantity INT, sr_id INT, unit_cost DECIMAL, total DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cold_storage_srs (id INT, party_id INT, sr_no STRING, via STRING, total DECIMAL, booking_id INT, booking_qnty INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, status INT, sr_no_manual INT, carrying_cost DECIMAL, agent_id INT, cold_srorage_inventory_id INT, voucher_id INT, loan_taken TINYINT, empty_bag_qty INT) PARTITIONED BY (sr_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS collection_target_details (id INT, party_id INT, total DECIMAL, collection_target_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS collection_target_employee_assignments (id INT, employee_id INT, collection_target_id INT, party_id INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, commission_rate DECIMAL, min_required_achievement DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS collection_targets (id INT, name STRING, branch_id INT, total_target DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS comments (id INT, table_name STRING, table_key INT, title STRING, message STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_bank_forwardings (id INT, commercial_invoice_id INT, bank_forwarding_id INT, quantity INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_doc_items (id INT, item_id INT, commercial_doc_id INT, product_id INT, feature_sheet STRING, quantity DECIMAL, hours DECIMAL, total DECIMAL, description STRING, duptotal DECIMAL, booking_unit_cost DECIMAL, lc_unit_cost DECIMAL, unit_id INT, sales_uom INT, sales_quantity DECIMAL, difference DECIMAL, style_id INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, order_id INT, indent_pi_id INT, if_product TINYINT, shipment_unit DECIMAL, ci_id INT, remaining_quantity DECIMAL, comm_tamount DECIMAL, comm_kg DECIMAL, comm_out_amt DECIMAL, comm_out_kg DECIMAL, fob_amount DECIMAL, fob_commission DECIMAL, hs_code STRING, shipment_qty DECIMAL, chassis STRING, engine STRING, quotes_purpose STRING, selection_criteria STRING, destination_transportation STRING, status INT, quantity_2 DECIMAL, discount_type INT, totaldiscount DECIMAL, provision_1 DECIMAL, sub_category_id INT, barcode STRING, carton_capacity DECIMAL, carton_quantity DECIMAL, general_discount DECIMAL, total_general_discount DECIMAL, total_trade_discount DECIMAL, trade_discount DECIMAL, tax_1 DECIMAL, tax DECIMAL, product_type STRING, promotion_list STRING, product_code STRING, free_product_promotion STRING, unit_cost DECIMAL, carton_loose_pcs DECIMAL, discount DECIMAL, src_discount DECIMAL, display_quantity DECIMAL, mrp DECIMAL, is_free TINYINT, inventory_id INT, tax_2 DECIMAL, rebate INT, rebate_percent INT, discount_3 DECIMAL, discount_4 DECIMAL, discount_5 DECIMAL, total_discount_3 DECIMAL, total_discount_4 DECIMAL, total_discount_5 DECIMAL, brokerage DECIMAL, brokerage_percent DECIMAL, tax_3 DECIMAL, tax_4 DECIMAL, tax_3_value DECIMAL, tax_4_value DECIMAL, common_sizes STRING, common_colors STRING, shipping_port INT, child_doc_number STRING, general_discount_percent DECIMAL, construction STRING, finished_weight DECIMAL, weave STRING, width STRING, net_weight STRING, gross_weight STRING, shrinkage_warp INT, shrinkage_weft INT, beam_no STRING, roll_number STRING, quality_code STRING, extra_quality_code STRING, qty_points INT, calculated_actual_weight DECIMAL, width_uom DECIMAL, no_of_pieces DECIMAL, grade STRING, display_gross_weight DECIMAL, display_calculated_actual_weight DECIMAL, roll_count INT, tax_5 DECIMAL, tax_5_value DECIMAL, currency_id STRING, boq_category_id INT, boq_sub_category_id INT, budget_item_id INT, exchange_rate_in_bdt INT, budget_item_account_id INT, additional_charge_id INT, additional_charge2_id INT, additional_charge3_id INT, additional_charge4_id INT, additional_charge_value DECIMAL, additional_charge2_value DECIMAL, additional_charge3_value DECIMAL, additional_charge4_value DECIMAL) PARTITIONED BY (shipping_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_doc_orders (id INT, order_id INT, doc_id INT, source_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_doc_vouchers (id INT, voucher_id INT, voucher_type INT, voucher_subtype INT, com_doc_id INT, com_doc_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_docs (id INT, type INT, order_number STRING, ref_order_number STRING, parent_doc_id STRING, party_id INT, employee_id INT, currency STRING, exchange_rate DECIMAL, src_amount DECIMAL, amount DECIMAL, discount DECIMAL, grand_total DECIMAL, sheet STRING, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, description STRING, status INT, serial_number INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, dupamount DECIMAL, src_dupamount DECIMAL, terms STRING, bank_id INT, production_program_id INT, doc_number STRING, inactive TINYINT, deleted TINYINT, party_address STRING, party_name STRING, att_branch_id INT, branch_id INT, department_id INT, asset_purpose INT, request_level INT, third_party_id INT, ref_bank_id INT, ref_party_id INT, outline_id INT, lc_type INT, lc_no STRING, sc_no STRING, indent_agent INT, advising_bank_id INT, container_shipment STRING, port_of_shipment STRING, destination_port STRING, edit_type STRING, revision_number STRING, payment_terms INT, partial_shipment INT, clauses STRING, other_party_id INT, production_no INT, sale_order_id INT, shipping_address STRING, sales_person INT, brand_id INT, provision_1 DECIMAL, reference STRING, attention STRING, subject STRING, completed_by INT, completed_time TIMESTAMP, project_id INT, inventory_id INT, destination_inventory_id INT, approved_by INT, recommend_by INT, approved_time TIMESTAMP, support_duration INT, comments STRING, parent_quotes_id INT, potential_id INT, remarks STRING, amount_after_support DECIMAL, implementation_time STRING, shipping_address_id INT, billing_address_id INT, additional_discount_percent DECIMAL, contact_person_id INT, total_tax DECIMAL, vat_percent DECIMAL, `less` DECIMAL, quotation_id INT, use_order_bom_delivery INT, use_order_bom_invoice INT, back_ref STRING, delivery_status INT, custom_field_6 STRING, custom_field_7 STRING, custom_field_8 STRING, custom_field_9 STRING, custom_field_10 STRING, accepted INT, product_id INT, custom_field_11 STRING, back_ref_number STRING, ref_bank_account_number STRING, ref_bank_account_name STRING, ref_bank_branch_name STRING, custom_field_12 STRING, payment_type INT, order_purpose_id INT, price_type INT, cost_center_id INT, incoterms INT, account_id INT, voucher_id INT, transaction_id INT, own_approval INT, job_request_id INT, rebate INT, show_qty_sum_display DECIMAL, team_id INT, shipment_term INT, shipping_method INT, inquiry_id INT, order_type_id INT, export_lc_no STRING, export_lc_value DECIMAL, export_days INT, import_lc_percent DECIMAL, tc_id INT, bank_branch INT, buying_house_name STRING, buyer_order_number STRING, lc_days INT, e_bin STRING, buyer_style_number STRING, swift_code STRING, bblc_value DECIMAL, bblc_no STRING, lc_value DECIMAL, lca_no STRING, irc_no STRING, erc_no STRING, fabric_length STRING, gmts_qnty STRING, bb_ref STRING, applicant_bin_no STRING, applicant_tin_no STRING, issue_bank_bin_no STRING, issue_bank_tin_no STRING, beneficiary_bin_no STRING, beneficiary_tin_no STRING, delivery_term STRING, fabric_origin STRING, insurance_no STRING, insurance_company_id INT, insurance_cover_note STRING, sappo_no STRING, bw_license STRING, ammendment_no STRING, ammendment_remarks STRING, port_of_loading STRING, shipping_marks STRING, marketing_person_name STRING, commercial_invoice_no INT, advising_bank_branch INT, sales_con_no STRING, sales_con_date STRING, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, party_code STRING, grade STRING, dms_backref_modified INT, trade_terms STRING, ait_percent DECIMAL, total_ait DECIMAL, attachment_url STRING, tittle STRING, boq_doc_type INT, boq_rwo_ref_id STRING, doc_signatory_id STRING, bank_signatory_id STRING, buyer_order_id INT, delivery_order_type INT, file_info STRING, vds_type INT, source_tax_type INT, source_tax_percent DECIMAL, total_source_tax DECIMAL, total_vat DECIMAL, delivery_terms_id INT, payment_terms_id INT) PARTITIONED BY (order_date DATE, completion_date DATE, expected_date DATE, delivery_date DATE, received_date DATE, requisition_date DATE, entry_date DATE, lc_opening_date DATE, lc_expiry_date DATE, shipment_expiry_date DATE, valid_till DATE, shipping_date DATE, pi_validity_date DATE, pi_date DATE, accep_liability_date DATE, bblc_date DATE, insurance_date DATE, bw_license_date DATE, ammendment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_invoice_outline (id INT, fob_amount TINYINT, fob_commission TINYINT, name STRING, accep_liability_date INT, code STRING, order_quantity INT, lc_no INT, lc_date INT, lc_date_label STRING, invoice_no_label STRING, invoice_date_label STRING, invoice_amount_label STRING, customer_name INT, customer_address INT, shipping_date INT, expiry_date INT, bank_name INT, bank_address INT, irc_no INT, lca_no INT, insurance_date INT, insurance_co_name INT, insurance_co_address INT, sappo_no INT, bw_license INT, bw_license_date INT, fabric_origin INT, delivery_terms INT, trade_terms INT, bin_no INT, tin_no INT, gmts_qnty_item INT, fabric_construction INT, bb_ref INT, port_of_loading INT, port_of_destination INT, shipping_marks INT, remarks INT, shipping_address INT, advising_bank_name INT, issuing_banks_bin_no INT, issuing_banks_tin_no INT, sales_con_no INT, sales_con_date INT, order_no INT, item INT, product INT, style_no INT, weight INT, weave INT, width INT, hs_code INT, construction INT, description INT, quantity INT, unit INT, lc_total INT, bblc_value INT, send_ci_prefix STRING, send_ci_code STRING, bill_of_exchange_prefix STRING, bill_of_exchange_code STRING, claim_memo_prefix STRING, claim_memo_code STRING, packing_list_prefix STRING, packing_list_code STRING, delivery_challan_prefix STRING, delivery_challan_code STRING, truck_receipts_prefix STRING, truck_receipts_code STRING, weight_and_measurement_prefix STRING, weight_and_measurement_code STRING, certificate_of_origin_prefix STRING, certificate_of_origin_code STRING, beneficiary_certificate_prefix STRING, beneficiary_certificate_code STRING, beneficiary_statement_prefix STRING, beneficiary_statement_code STRING, fabric_length_certificate_prefix STRING, fabric_length_certificate_code STRING, beneficiary_compliance_prefix STRING, beneficiary_compliance_code STRING, manufacture_certificate_prefix STRING, manufacture_certificate_code STRING, azo_dyestuf_chemical_prefix STRING, azo_dyestuf_chemical_code STRING, inspection_certificate_prefix STRING, inspection_certificate_code STRING, shipment_advice_prefix STRING, shipment_advice_code STRING, packing_certificate_prefix STRING, packing_certificate_code STRING, production_certificate_prefix STRING, production_certificate_code STRING, country_of_origin_prefix STRING, country_of_origin_code STRING, undertaking_refrence_prefix STRING, undertaking_refrence_code STRING, bank_forwarding_prefix STRING, bank_forwarding_code STRING, roll_count INT, doc_signatory INT, bank_signatory INT, truck_no INT, truck_receipts_date INT, claim_ref_date INT, claim_percent INT, claim_month INT, forwarding_date INT, delivery_challan_no INT, delivery_challan_date INT, shipment_advice_date INT, doc_submitted_date INT, unit_gross_weight INT, gross_weight INT, unit_net_weight INT, net_weight INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_invoices (id INT, bill_of_lading_no STRING, bill_of_entry_no STRING, shipping_mode INT, vessel_name STRING, depart_port STRING, arrival_port STRING, present_dest STRING, shipping_line STRING, is_accepted TINYINT, cnf_forwarder_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, exp_no STRING, bill_of_exchange STRING, country_of_origin STRING, mlc_no STRING, mlc_date STRING, mlc_value STRING, trade_terms STRING, fabric_not_less DECIMAL, mp_code STRING, mp_name STRING, amounts_in_word STRING, fabric_construction STRING, delivery_challan_no STRING, packing_list_no STRING, undertaking_no STRING, beneficiary_certificate_ref STRING, certificate_of_origin STRING, product_certificate_ref STRING, forwarding_ref STRING, export_permit_no STRING, pi_lc_required STRING, bblc_received STRING, pi_delivery STRING, fob STRING, raw_material_origin STRING, truck_no STRING, buying_house_code STRING, signatory_name STRING, signatory_designation STRING, employee_designation STRING, bank_signatory_code STRING, bank_signatory_name STRING, bank_signatory_designation STRING, claim_usd DECIMAL, claim_percent STRING, claim_amount_in_word STRING, claim_month STRING, fright_collect STRING, to_depz_desig STRING, azo_ref STRING, beneficiary_stat_ref STRING, claim_ref_no STRING, manufacturers_ref STRING, packing_certificate_ref STRING, shipment_advice_ref STRING, weight_measure_ref STRING, fabric_length_ref STRING, inspection_cert_ref STRING, applicants_name STRING, applicants_address STRING, packing_standards STRING, truck_receipts_ref STRING, over_due_interest STRING, doc_present_days STRING, bin_no STRING, no_of_roll STRING) PARTITIONED BY (bill_of_lading_date DATE, bill_of_entry_date DATE, etd_date DATE, eta_date DATE, acceptance_date DATE, maturity_date DATE, delivery_challan_date DATE, packing_list_date DATE, undertaking_date DATE, bill_of_exchange_date DATE, beneficiary_certificate_date DATE, certificate_of_origin_date DATE, product_certificate_ref_date DATE, forwarding_date DATE, export_permit_date DATE, submit_date DATE, azo_date DATE, beneficiary_stat_date DATE, claim_ref_date DATE, manufacturer_ref_date DATE, packing_certificate_date DATE, shipment_advice_date DATE, weight_measure_date DATE, fabric_length_ref_date DATE, inspection_cert_date DATE, truck_receipts_date DATE, exp_date DATE, doc_submitted_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS commercial_sale_order (id INT, com_doc_id INT, sale_order_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commission_statement (id INT, lc_id INT, ci_id INT, party_id INT, cs_number STRING) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS commission_statement_details (id INT, commission_statement_id INT, quantity DECIMAL, unit_price DECIMAL, amount DECIMAL, tl_amount DECIMAL, fob_amount DECIMAL, comm_tamount DECIMAL, comm_kg DECIMAL, comm_out_amt DECIMAL, comm_out_kg DECIMAL, fob_commission DECIMAL, total_comm_amount DECIMAL, total_comm_kg DECIMAL, total_comm_out_amt DECIMAL, total_comm_out_kg DECIMAL, total_fob_commission DECIMAL, product_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS commissions (id INT, designation_id INT, employee_id INT, commission_percentage DECIMAL, commission_amount DECIMAL, sales_target_id INT) PARTITIONED BY (commission_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS companies (id INT, no_of_share INT, share_unit_price DECIMAL, full_name STRING, print_as STRING, registration_no STRING, website STRING, phone STRING, alt_phone STRING, fax STRING, email STRING, alt_email STRING, mobile STRING, alt_mobile STRING, description STRING, address_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by STRING, updated TIMESTAMP) PARTITIONED BY (founded DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS company_loan_vouchers (id INT, loan_id INT, voucher_id INT, capital DECIMAL, charge DECIMAL) PARTITIONED BY (payment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS company_loans (id INT, loan_number STRING, name STRING, bank_account_id INT, loan_account_id INT, status INT, type INT, loan_amount DECIMAL, interest_rate DECIMAL, paid_amount DECIMAL, installment_amount DECIMAL, total_installments INT, paid_installments INT, installment_type INT, description STRING, created TIMESTAMP, created_by INT, auto_gen INT, updated_by INT, updated TIMESTAMP, doc_id INT) PARTITIONED BY (value_date DATE, maturity_date DATE, next_payment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS complain_responses (id INT, employee_id INT, complaint_id INT, response STRING, attachment_url STRING, status INT, show_cause_id INT) PARTITIONED BY (created DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS complaints (id INT, employee_id INT, complain_no STRING, complain_by INT, on_behalf_of STRING, description STRING, misconduct_id INT, status INT, deleted INT, inactive INT, updated_by INT, created_by INT) PARTITIONED BY (created DATE, updated DATE, `start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS configs (id INT, name STRING, value STRING, type STRING, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS contact_groups (id INT, name STRING, code STRING, source_type STRING, source_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS contact_persons (id INT, status INT, party_id INT, designation STRING, department STRING, subject STRING, type INT, name STRING, relation STRING, organization STRING, gender INT, phone STRING, mobile STRING, alt_phone STRING, email STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, address STRING, is_relative INT, phone_prefix STRING, mob_prefix STRING, reference_type INT, employee_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS contacts (id INT, name STRING, affiliation STRING, source_type STRING, source_id INT, mobile STRING, email STRING, verified TINYINT, inactive TINYINT, deleted TINYINT, verification_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS contract_product_orders (id INT, voucher_id INT, raw_order_item_id INT, contract_product_id INT, bill_type INT, reverted INT, contract_product_history_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cost_center (id INT, name STRING, code STRING, description STRING, inactive TINYINT, deleted TINYINT, cost_type_id INT, category INT, ic_common_account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cost_center_accounts (id INT, cost_center_id INT, account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cost_center_types (id INT, name STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS cost_center_wise_account_balances (id INT, cost_center_id INT, account_id INT, amount DECIMAL, debit_amount DECIMAL, credit_amount DECIMAL, account_amount DECIMAL) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS courier (id INT, ci_id INT, courier_name STRING, courier_no STRING, description STRING, receiving_bank_id INT, courier_awb STRING, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, created_at TIMESTAMP, updated_at TIMESTAMP) PARTITIONED BY (dispatch_date DATE, receiving_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS courier_package_details (id INT, courier_package_id INT, address STRING, delivery_id INT, status INT, due_amount DECIMAL, paid_amount DECIMAL, delivery_date TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS courier_packages (id INT, code STRING, status INT, courier_service_id INT, country_id INT, city_id INT, thana_id INT, receiver_id INT, created_date TIMESTAMP, delivery_date TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS courier_services (id INT, status INT, category INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS credit_card_info (id INT, sale_order_id INT, card_device_id INT, cash_account_id INT, card_device_account_id INT, bank_charge_percent DECIMAL, grand_total DECIMAL, cash_amount DECIMAL, card_amount DECIMAL, due_amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT, card_type INT, voucher_id INT, payment_method INT, card_bank_id INT, card_number STRING, transaction_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS credit_card_types (id INT, name STRING, code STRING, branch_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_activity (id INT, party_id INT, related_type INT, related_value INT, phone_type INT, phone_number STRING, call_type INT, subject STRING, assign_employee_id INT, status INT, start_time STRING, end_time STRING, duration INT, description STRING, location STRING, activity_type INT, activity_result STRING, created TIMESTAMP, updated TIMESTAMP, next_activity_id INT, contact_person_id INT, inactive TINYINT, parent_id INT, created_by INT, updated_by INT, party_type STRING, branch_id INT, activity_number STRING, call_response_status INT, appointment_time STRING, is_satisfied INT, dissatisfaction_reasons STRING, satisfaction_level INT, visitor_id_list STRING) PARTITIONED BY (start_date DATE, next_activity_date DATE, appointment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_activity_attendee_client (id INT, crm_activity_id INT, client_name STRING, department STRING, designation STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_activity_attendee_employee (id INT, crm_activity_id INT, employee_id INT, employee_name STRING, department STRING, designation STRING, user_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_b2b_marketings (id INT, title STRING, description STRING, start_time STRING, end_time STRING, duration STRING, hours INT, minutes INT, assigned_to INT, related_to INT, related_value INT, status INT, created_by INT, updated_by INT, party_type INT, party_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_bonus (id INT, sales_tier_id INT, employee_id INT, amount DECIMAL, sales_location_id INT) PARTITIONED BY (bonus_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_bonus_details (id INT, bonus_id INT, employee_id INT, amount DECIMAL) PARTITIONED BY (bonus_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_business_type (id INT, business_type_name STRING, inactive TINYINT, business_category_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_campaign_type_lists (id INT, campaign_id INT, campaign_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_campaigns (id INT, branch_id INT, campaign_name STRING, actual_cost DECIMAL, assigned_to INT, budget DECIMAL, description STRING, date_created TIMESTAMP, date_modified TIMESTAMP, expected_leads DECIMAL, expected_cost DECIMAL, expected_revenue DECIMAL, frequency INT, campaign_type INT, objective STRING, is_advertise INT, is_tvc INT, is_billboard INT, status INT, month INT, year INT, source_type STRING, source_id INT, created_by INT) PARTITIONED BY (start_date DATE, end_date DATE, next_start_date DATE, next_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_campaigns_type (id INT, type_name STRING, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_category_type (id INT, category_type_name STRING, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_d2d_marketings (id INT, title STRING, description STRING, start_time STRING, end_time STRING, duration STRING, hours INT, minutes INT, assigned_to INT, related_to INT, related_value INT, status INT, created_by INT, updated_by INT, party_type INT, party_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_demonstration_client_invitees (id INT, demonstration_id INT, client_name STRING, designation STRING, department STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_demonstration_invitees (id INT, demonstration_id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_demonstrations (id INT, demonstration_subject STRING, related_to INT, related_value INT, description STRING, location STRING, duration STRING, hours INT, minutes INT, start_time STRING, end_time STRING, status INT, assigned_to INT, created_by INT, updated_by INT, call_id INT, party_type INT, party_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_leads (id INT, organization_id INT, organization_contacts_id INT, party_type STRING, title STRING, description STRING, campaigns_id INT, leads_source INT, leads_source_description STRING, assign_to INT, lead_owner INT, lead_follower INT, status INT, created TIMESTAMP, modified TIMESTAMP, product_id INT, leads_parent_id INT, opportunity_code STRING, inactive TINYINT, branch_id INT, created_by INT) PARTITIONED BY (contact_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_meetings (id INT, related_to INT, related_value INT, meeting_subject STRING, meeting_direction STRING, hours INT, minutes INT, description STRING, location STRING, modified_by STRING, schedule_meeting_subject STRING, status STRING, assigned_to INT, start_time STRING, end_time STRING, call_id INT, party_type INT, party_id INT) PARTITIONED BY (schedule_date DATE, meeting_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_meetings_attendee (id INT, meeting_id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_meetings_client_table (id INT, meeting_id INT, client_name STRING, designation STRING, department STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_presentation_client_invitees (id INT, presentation_id INT, client_name STRING, designation STRING, department STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_presentation_invitees (id INT, presentation_id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_presentations (id INT, presentation_subject STRING, related_to INT, related_value INT, description STRING, location STRING, duration STRING, hours INT, minutes INT, start_time STRING, end_time STRING, status INT, assigned_to INT, created_by INT, call_id INT, party_type INT, party_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_quote_outlines (id INT, name STRING, code STRING, style INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, raw_materials INT, importer INT, exporter INT, importer_text STRING, exporter_text STRING, order_no INT, currency INT, hs_code INT, party_address INT, shipping_address INT, party_phone INT, party_email INT, party_contact INT, sales_person INT, brand INT, product_quantity INT, reference INT, attention INT, subject INT, term_1 INT, term_2 INT, term_3 INT, term_4 INT, term_5 INT, term_1_text STRING, term_2_text STRING, term_3_text STRING, term_4_text STRING, term_5_text STRING, order_number_autogenerate INT, chassis INT, product_category INT, product_code INT, show_stock INT, duplicate_product INT, prefix STRING, ref_work_order INT, save_and_print INT, product_movement INT, bulk_product_load INT, description_in_grid INT, quotes_purpose_in_grid INT, item_id INT, category_id INT, ref_party_id INT, expected_date INT, party_label STRING, page_title STRING, terms_and_conditions INT, expiry_date INT, purchase_request INT, barcode INT, requisition_quantity INT, min_order_quantity INT, max_order_quantity INT, avg_tp INT, inventory_id INT, inventory_label STRING, additional_discount INT, general_discount INT, trade_discount INT, total_general_discount INT, total_trade_discount INT, promotion_list_show INT, gift_coupon INT, special_discount INT, `less` INT, tax_1 INT, tax_2 INT, tax_3 INT, tax_4 INT, unit_cost_editable INT, discount_editable INT, carton_info INT, quotation INT, requisition_no INT, tax_1_editable INT, buyer_label STRING, tax_5 INT, tittle INT, vat_after_special_discount INT, show_product_image INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_quotes (id INT, total_promotional_discount DECIMAL, total_trade_discount DECIMAL, total_general_discount DECIMAL, total_special_discount DECIMAL, special_discount_percent DECIMAL, sub_total DECIMAL, src_discount DECIMAL, coupon_discount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_quotes_transitions (id INT, quote_id INT, re_quote_id INT, status_id INT, prev_status_id INT, remarks STRING, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crm_sales_targets (id INT, name STRING, product_id INT, sales_tier_id INT, designation_id INT, employee_id INT, target_amount DECIMAL, frequency INT, sales_location_id INT, month INT, year INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_allocation_items (id INT, crp_workcenter_allocation_id INT, prod_unit_id INT, no_of_machines INT, no_of_operators INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_allocations (id INT, workcenter_id INT, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_capacity (id INT, workcenter_id INT, machine_id INT, product_id INT, capacity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, variant_1 INT, variant_2 INT, employee_id INT, department_id INT, working_hour_duration INT, overtime_duration INT, absenteeism DECIMAL, efficiency DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_line_alloc_histories (id INT, workcenter_id INT, prod_unit_id INT, machine_addition INT, machine_deduction INT, operator_deduction INT, operator_addition INT, branch_id INT) PARTITIONED BY (start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_line_allocations (id INT, workcenter_id INT, prod_unit_id INT, no_of_machines INT, no_of_operators INT, branch_id INT) PARTITIONED BY (start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_machines (id INT, workcenter_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, registered_machine_id INT, prod_unit_id INT, capacity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenter_operators (id INT, workcenter_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, employee_id INT, department_id INT, working_hour_duration INT, overtime_duration INT, absenteeism DECIMAL, efficiency DECIMAL, name_alias STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS crp_workcenters (id INT, name STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, workcenter_size INT, workcenter_efficiency DECIMAL, absenteism DECIMAL, standard_working_hour DECIMAL, standard_overtime_hour DECIMAL, observe_time DECIMAL, operator_allowance DECIMAL, machine_allowance DECIMAL, standard_working_hour_duration INT, standard_overtime_duration INT, machine_quantity INT, prod_unit_id INT, no_of_shifts INT, branch_id INT, shift_list STRING, holiday_policy_list STRING, team_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_available_brands (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_available_models (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, brand_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_favorite_feature (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_occupation (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_purchase_reasons (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_use_purpose (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS cs_vehicle_purposes (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey (id INT, title STRING, topic STRING, type INT, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, survey_number STRING, model_type INT, csi_for STRING) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey_options (id INT, type INT, option STRING, weightage_marks INT, narration STRING, attachment STRING, survey_question_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey_questions (id INT, question_type INT, question STRING, narration STRING, attachment STRING, survey_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey_responsed_answers (id INT, survey_responsed_question_id INT, answer STRING, survey_options_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey_responsed_questions (id INT, survey_response_id INT, question_id INT, question_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS csi_survey_responses (id INT, party_id INT, survey_submit_date TIMESTAMP, survey_id INT, job_id INT, owner_id INT, survey_rating INT, remarks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, issue_type INT, issue INT, ref_survey_response INT, response_survey_number STRING, model_type INT, performed_branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS currencies (code STRING, name STRING, sign STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, major_unit STRING, minor_unit STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS currency_rates (id INT, all_payroll_schedule_id INT, currency_code STRING, rate DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, payment_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS custom_purchase_orders (id INT, vat_included_product_price TINYINT, aluminium_vat_percent DECIMAL, aluminium_total_vat DECIMAL, aluminium_vat_account_id INT, aluminium_ait_percent DECIMAL, aluminium_total_ait DECIMAL, aluminium_ait_account_id INT, aluminium_rebate_percent DECIMAL, aluminium_total_rebate DECIMAL, aluminium_rebate_account_id INT, goods_receivable_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS custom_vouchers (id INT, custom_type INT, name STRING, pattern STRING, prefix STRING, useit STRING, accounts_type STRING, contra_accounts_type STRING, account_ids STRING, contra_account_ids STRING, view_template STRING, party_type INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, account_code TINYINT, multi_currency TINYINT, display_branch_info TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_categories (id INT, type_name STRING, index INT, can_refer TINYINT, self_purchase_point TINYINT, referral_point TINYINT, calculate_point_by_formula TINYINT, fixed_point_percent DECIMAL, service_invoice_shows_quantity TINYINT, service_invoice_shows_unit_cost TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, party_type STRING, electricity_rate DECIMAL, discount_percent DECIMAL, discount_not_on INT, discount_not_on_2 INT, discount_not_on_3 INT, depth INT, parent_id INT) PARTITIONED BY (discount_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_category_change_log (id INT, customer_id INT, category_id INT, label STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_credit_configs (id INT, party_id INT, credit_method INT, credit_pulse INT, based_on INT, credit_days INT, max_due_percent DECIMAL, calculation_times DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_groups (id INT, name STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_inventories (id INT, name STRING, address_id INT, branch_id INT, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_inventory_journals (id INT, commercial_doc_id INT, commercial_doc_item_id INT, delivered_quantity DECIMAL, product_id INT, variant_1 STRING, variant_2 STRING, variant_3 STRING, variant_4 STRING, variant_5 STRING, variant_6 STRING, inventory_id INT, inventory_journal_type INT, project_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, cost DECIMAL, dirty INT, style_id INT, if_product INT, chassis STRING, length STRING, standard_wt_per_kg_feet DECIMAL, standard_wt_per_pcs_kgs DECIMAL, actual_wt_kg_feet DECIMAL, over_less_wt DECIMAL, net_production_wt DECIMAL, wastage DECIMAL, dia_no STRING, product_code STRING, barcode STRING, custom_field_1 INT, party_id INT, qty_pcs DECIMAL, qty_uom DECIMAL, qty_kgs DECIMAL) PARTITIONED BY (entry_date DATE, manufacturing_date DATE, expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_permission_histories (id INT, customer_id INT, total_sales_amount DECIMAL, due_amount DECIMAL, paid_amount DECIMAL, booked_amount DECIMAL, previous_amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_permission_serial_histories (id INT, customer_permission_histories_id INT, product_id INT, delivery_no STRING, order_no STRING, serial_1 STRING, serial_2 STRING, unit_price DECIMAL, status INT, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_pre_sales_inspections (id INT, party_id INT, product_id INT, branch_id INT, finance_company_branch STRING, finance_company_code STRING, customer_age INT, monthly_income INT, apply_loan_amount INT, customer_category INT, emi_for INT, having_bank_ac INT, having_loan INT, emp_certificate INT, family_guarantor INT, address_verification INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_promotion_products (id INT, promotion_id INT, item_id INT, product_id INT, promotional_price DECIMAL, promotional_discount DECIMAL, promotional_discount_percent DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, promotional_special_discount DECIMAL, promotional_special_discount_percent DECIMAL, promotional_general_discount DECIMAL, promotional_general_discount_percent DECIMAL, branch_id INT, sub_category_id INT, code STRING, barcode STRING, product_sale_discount DECIMAL, product_sale_discount_2 DECIMAL, base_tp DECIMAL, base_sale_price DECIMAL, product_sale_discount_percent DECIMAL, vendor_id INT, min_quantity DECIMAL, max_quantity DECIMAL, is_recurrent DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_promotions (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, promotion_type INT, promo_code STRING, outline_id INT, status INT, applied_branch_id INT, sub_category_id INT, sub_category_2_id INT, sub_category_3_id INT, sub_category_4_id INT, discount_percent DECIMAL, discount DECIMAL, supp_discount_percent DECIMAL, supp_discount DECIMAL, customer_category_id INT, payment_method INT, vendor_promo_applicable_on INT, payment_method_cash INT, payment_method_credit INT, payment_method_cash_and_card INT, payment_method_emi INT, payment_method_card INT, discount_3_percent DECIMAL, discount_3 DECIMAL, discount_4_percent DECIMAL, discount_4 DECIMAL, discount_5_percent DECIMAL, discount_5 DECIMAL, discount_3_applicable_on INT, discount_4_applicable_on INT, discount_5_applicable_on INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_query (id INT, query_number STRING, query_type INT, query_description STRING, next_activity_id INT, next_activity_description STRING, branch_id INT, assign_employee_id INT, status INT, execution_time STRING, created TIMESTAMP, created_by INT) PARTITIONED BY (next_activity_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_query_customers (id INT, customer_query_id INT, customer_name STRING, phone STRING, invoice STRING, party_id INT, address STRING) PARTITIONED BY (sale_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_query_problems (id INT, customer_query_id INT, problem_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_query_products (id INT, customer_query_id INT, product_id INT, product_serial_id INT, product_serial_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_routes (id INT, route_id INT, customer_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_services (id INT, issue_subject STRING, issue_detail STRING, warranty_checking STRING, support_agreement_checking STRING, issue_type INT, issue_origin INT, priority INT, customer_id INT, product_id INT, case_owner INT, status_type INT, status INT) PARTITIONED BY (possible_delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS customer_vehicle_additional_informations (id INT, birth_certificate STRING, weight STRING, driving_license STRING, driving_location INT, previous_model INT, favourite_feature INT, communication_source INT, road_condition INT, second_model INT, occupation INT, purchase_reason INT, purpose INT, customer_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS customers (id INT, category INT, assign_to INT, relation INT, customer_category_id INT, customer_group_id INT, membership_card_id INT, business_type_id INT, customer_sub_category_id INT, customer_sub_category_1_id INT, customer_sub_category_2_id INT, customer_sub_category_3_id INT, dealer_provision INT, driving_license STRING, birth_certificate_number STRING, profession STRING, company_recognition_by STRING, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, weight DECIMAL, education STRING, ownership_status INT, global_id INT, license_type INT, ministry_id INT, office_layer_id INT, office_origin_id INT, geo_division_id INT, geo_district_id INT, geo_upazila_id INT, doptor_office_id INT, digital_nothi_code STRING, latitude DECIMAL, longitude DECIMAL) PARTITIONED BY (from_date DATE, card_expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS dashboard_info_cards (id INT, dashboard_id INT, info_card_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dashboard_portlets (id INT, dashboard_id INT, portlet_id INT, pcolumn INT, position INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS dashboard_quick_links (id INT, name STRING, link STRING, `order` INT, user_id INT, inactive INT, deleted INT, created INT, created_by INT, updated INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dashboard_users (id INT, dashboard_id INT, priority INT, role_id INT, deleted INT, is_default TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dashboards (id INT, link STRING, tcolumn INT, title STRING, design_css STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS data_translations (id INT, table_name STRING, table_key INT, column_name STRING, value STRING, language STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_aisle_wise_rack_configs (id INT, serial_no STRING, rack_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_cable_manager (id INT, name STRING, serial_no STRING, model_id INT, brand_id INT, color_id INT, comments STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_device_contract_histories (id INT, device_config_id INT, previous_contract_id INT, latest_contract_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_device_rack_configs (id INT, rack_id INT, device_type_id INT, device_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, continent_id INT, country_id INT, region_id INT, floor_id INT, building_id INT, room_id INT, row_id INT, install_in INT, device_power_type INT, primary_power INT, secondary_power INT, customer_id INT, employee_id INT, mounting_side INT, comments STRING, occupied_unit_no INT, start_unit INT, end_unit INT, service_contract_id INT, service_id_list STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_location_types (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_locations (id INT, name STRING, room_type STRING, parent_id INT, address STRING, is_last_label INT, x_coor STRING, y_coor STRING, location_type INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_pdu (id INT, name STRING, serial_no STRING, model_id INT, brand_id INT, color_id INT, socket_type STRING, socket_number INT, power_indicator INT, circuit_protection INT, digital_monitoring INT, internal_wiring INT, cable_specs STRING, cable_length STRING, plug_type STRING, max_voltage STRING, max_current STRING, comments STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_placed_objects (id INT, object_id INT, top_coordinate INT, left_coordinate INT, room_id INT, width INT, height INT, rotate_deg INT, device_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_racks (id INT, name STRING, code STRING, model_id STRING, unit_no INT, placed_coor_1 INT, placed_coor_2 INT, location_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, rack_type_id INT, service_type INT, customer_id INT, serial_no STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_servers (id INT, name STRING, rack_id INT, occupied_unit_no INT, start_unit INT, end_unit INT, rack_lock_no INT, rack_key_no INT, heat_limit DECIMAL, heat_threshold DECIMAL, manufacturer_max_watt DECIMAL, branch_id INT, weight DECIMAL, no_of_plug INT, power_status INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, comments STRING, serial_no STRING, model_id INT, ip_address STRING, processor INT, memory_limit STRING, local_drive STRING, host_nic STRING, size_in_inches INT, is_assembled INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dcim_ups (id INT, name STRING, serial_no STRING, model_id INT, brand_id INT, color_id INT, socket_type STRING, socket_number INT, power_indicator INT, circuit_protection INT, digital_monitoring INT, battery_power INT, backup_time INT, plug_type STRING, max_voltage STRING, max_current STRING, comments STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dealer_product_stocks (id INT, customer_id INT, product_id INT, previous_stock DECIMAL, current_stock DECIMAL, opening_balance DECIMAL, closing_balance DECIMAL, branch_id INT, area_id INT, zone_id INT, region_id INT, ref_id INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS dealer_requisition_log (id INT, pro_number STRING, pro_id INT, item INT, product INT, quantity DECIMAL, unit INT, unit_cost DECIMAL, created TIMESTAMP, created_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS debit_credit_note_orders (id INT, debit_credit_note_id INT, order_id INT, amount DOUBLE, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS debit_credit_notes (id INT, party_id INT, note_type INT, order_id INT, account_id INT, contra_account_id INT, discount_acc_id INT, voucher_id INT, description STRING, total DECIMAL, discount DECIMAL, grand_total DECIMAL, amount DECIMAL, mode INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, vat DECIMAL, vat_account_id DECIMAL) PARTITIONED BY (note_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS deliveries (id INT, last_status INT, order_id INT, inventory_id INT, from_project INT, production_id INT, planed TINYINT, shipped TINYINT, ref_delivery_id INT, dest_inventory_id INT, delivery_outline_id INT, total_vat DECIMAL, shipment_id INT, shipping_address STRING, work_order_id INT, reference STRING, attention STRING, subject STRING, chassis STRING, engine STRING, request_id INT, qc_flag TINYINT, qc_number STRING, vat_reg_no STRING, mushok_11_no STRING, etin_no STRING, driver_name STRING, contact_person_name STRING, contact_no STRING, vehicle_no STRING, shipping_address_id INT, billing_address_id INT, delivery_custom_field STRING, delivery_custom_field_2 STRING, ref_branch_id INT, delivery_custom_field_3 STRING, job_request_id INT, purchase_type STRING, commercial_invoice INT, issue_type_id INT, prod_unit_id INT, for_inventory INT, convert_to_asset INT, style_id INT, production_type_code STRING, sub_contract_type_code STRING, sub_contract_company_code STRING, set_no STRING, plate_no STRING, truck_number STRING, export_type_code STRING, fabric_note STRING, extra_quality_code INT, proforma_invoice INT, lc_id INT, currency STRING, exchange_rate DECIMAL, is_bond_item INT, commercial_doc_id INT, courier_service_id INT, is_sd_posted_to_system INT, auto_accept INT, instant_invoice INT) PARTITIONED BY (receive_date DATE, due_date DATE, factory_dispatch_date DATE, qc_date DATE, delivery_custom_field_1 DATE, lc_date DATE, ip_date DATE, be_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS delivery_outlines (id INT, name STRING, code STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, barcode TINYINT, enlist_no TINYINT, area_code TINYINT, carton_info TINYINT, sale_order TINYINT, work_order TINYINT, shipping_address TINYINT, reference TINYINT, attention TINYINT, subject TINYINT, party_type_party TINYINT, chassis TINYINT, engine TINYINT, debit_account TINYINT, cogs_unit TINYINT, cogs_total TINYINT, show_note TINYINT, vat_reg_no TINYINT, mushok_11_no TINYINT, etin_no TINYINT, driver_name TINYINT, contact_person_name TINYINT, contact_no TINYINT, vehicle_no TINYINT, item_filter TINYINT, category_filter TINYINT, product_code TINYINT, product_movement TINYINT, discount_per_product TINYINT, avg_tp TINYINT, ordered_qty TINYINT, ref_no TINYINT, ref_voucher TINYINT, purchase_request TINYINT, product_name_text TINYINT, description_in_grid TINYINT, number_of_unit TINYINT, custom_field TINYINT, custom_field_1 TINYINT, bin TINYINT, order_id TINYINT, delivered_quantity INT, rpu_readonly TINYINT, invoice_ref_mandatory TINYINT, po_mandatory TINYINT, total_editable TINYINT, market_return_mandatory INT, qr_code INT, ref_no_rename STRING, attention_rename STRING, reference_rename STRING, purchase_type INT, purchase_invoice INT, lc_no INT, lc_date INT, commercial_invoice_no INT, purchase_order INT, ip_date INT, be_date INT, description INT, auto_lot INT, issue_type INT, vendor INT, department INT, receive_date INT, total_amount INT, set_no INT, delivery_date_rename STRING, receive_quantity_rename STRING, default_inventory INT, fc_unit_cost INT, branch_id_required INT, product_requisition INT, address_type_mandatory INT, instant_invoice INT, auto_accept INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS delivery_products (id INT, delivery_id INT, type INT, product_id INT, quantity DECIMAL, order_id INT, damaged DECIMAL, order_product_id INT, display_quantity DECIMAL, total DECIMAL, unit_cost DECIMAL, fc_unit_cost DECIMAL, project_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, warranty INT, container STRING, cogs_unit_cost DECIMAL, cogs_total DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, deleted TINYINT, expense_amount DECIMAL, inventory_id INT, closing_balance DECIMAL, vat DECIMAL, carton_quantity DECIMAL, carton_capacity DECIMAL, po_id INT, wo_id INT, note DECIMAL, total_note_amount DECIMAL, free_product_qty DECIMAL, chassis STRING, engine STRING, effective_quantity DECIMAL, qty_uom DECIMAL, qty_in_pack DECIMAL, pack_wt DECIMAL, wt_unit DECIMAL, delivery_wt DECIMAL, unit_id INT, qty_kgs DECIMAL, category_id INT, shaft_cutting_pcs DECIMAL, mm DECIMAL, inch DECIMAL, kgs DECIMAL, total_kgs DECIMAL, total_mm DECIMAL, remarks STRING, local_scrap DECIMAL, production_id INT, finish_product_id INT, rule_for_kgs DECIMAL, length DECIMAL, standard_wt_per_kg_feet DECIMAL, standard_wt_per_pcs_kgs DECIMAL, actual_wt_kg_feet DECIMAL, over_less_wt DECIMAL, net_production_wt DECIMAL, wastage DECIMAL, dia_no DECIMAL, qty_pcs DECIMAL, description STRING, rejected_quantity DECIMAL, carton_loose_pcs DECIMAL, provision_1 DECIMAL, product_code STRING, barcode STRING, print_qty DECIMAL, is_asset TINYINT, product_type STRING, tax_4 DECIMAL, tax_4_value DECIMAL, set_no STRING, beam_no STRING, roll_number STRING, quality_code STRING, extra_quality_code STRING, qty_points INT, gross_weight DECIMAL, calculated_actual_weight DECIMAL, width_uom DECIMAL, no_of_pieces DECIMAL, plate_no STRING, grade STRING, style_id INT, display_gross_weight DECIMAL, display_calculated_actual_weight DECIMAL, unit_weight DECIMAL, vat_included_flag INT, unit_cost_with_vat DECIMAL) PARTITIONED BY (manufacturing_date DATE, expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS delivery_reasons (id INT, name STRING, code STRING, inactive INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS delivery_status (id INT, delivery_id INT, status INT, description STRING, onsite_party_id INT, address_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS delivery_terms (id INT, name STRING, code STRING, type INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS department_details (id INT, parent_id INT, children_id INT, depth INT, branch_id INT, parent_depth_id INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS department_outlines (id INT, name STRING, level_1 STRING, level_2 STRING, level_3 STRING, level_4 STRING, inactive TINYINT, deleted TINYINT, level_5 STRING, level_6 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS department_wise_task_goal_mapping (id INT, department_id INT, goal_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS department_wise_task_type_mapping (id INT, department_id INT, type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS departments (id INT, name STRING, print_as STRING, code STRING, parent_id INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, depth INT, `order` INT, branch_id INT, branch_id_list STRING) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS departments_rank (id INT, department_id INT, rank INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_basic_level_infos (id INT, name STRING, code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_branch_wise_mappings (id INT, level_id INT, type_id INT, parent_id INT, depth INT, designation_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, branch_id INT, code STRING, dept_level_1 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_hierarchy (id INT, designation_id INT, parent_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_level (id INT, name STRING, code STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, parent_id INT, branch_id INT, branch_head INT, dept_level_1 INT, dept_level_2 INT, dept_level_3 INT, dept_level_4 INT, dept_level_5 INT, dept_level_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_level_details (id INT, type_id INT, level_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_names (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS designation_type (id INT, name STRING, code INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS designations (id INT, name STRING, print_as STRING, code STRING, department_id INT, parent_id INT, `order` INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, branch_id INT, type INT, level INT, branch_id_list STRING, designation_rank INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS device_settings (id INT, name STRING, device_type INT, machine_id STRING, ip STRING, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive INT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS dias_no (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, health STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS disciplinary_committees (id INT, title STRING, members STRING, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS disciplinary_statements (id INT, complain_no STRING, employee_id INT, action_id INT, explanation_details STRING, punishment_description STRING, complain_by INT, on_behalf_of STRING, offense_description STRING, committee_description STRING, reason_id INT, type INT, parent_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, ref_no STRING, complaint_ref_no STRING, committee_members STRING, misconduct_id INT) PARTITIONED BY (issue_date DATE, explanation_date DATE, complain_date DATE, execution_date DATE, notice_period DATE, salary_held_start DATE, salary_held_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS discount_provisions (id INT, model_id INT, sub_category_id INT, item_id INT, product_id INT, provision_1 DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) PARTITIONED BY (entry_date DATE, effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_clockedschedule (id INT, clocked_time TIMESTAMP, enabled TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_crontabschedule (id INT, minute STRING, hour STRING, day_of_week STRING, day_of_month STRING, month_of_year STRING, timezone STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_intervalschedule (id INT, every INT, period STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_periodictask (id INT, name STRING, task STRING, args STRING, kwargs STRING, queue STRING, `exchange` STRING, routing_key STRING, expires TIMESTAMP, enabled TINYINT, last_run_at TIMESTAMP, total_run_count STRING, date_changed TIMESTAMP, description STRING, crontab_id INT, interval_id INT, solar_id INT, one_off TINYINT, start_time TIMESTAMP, priority STRING, headers STRING, clocked_id INT, expire_seconds STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_periodictasks (ident SMALLINT, last_update TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_beat_solarschedule (id INT, event STRING, latitude DECIMAL, longitude DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_celery_results_taskresult (id INT, task_id STRING, status STRING, content_type STRING, content_encoding STRING, result STRING, date_done TIMESTAMP, traceback STRING, meta STRING, task_args STRING, task_kwargs STRING, task_name STRING, worker STRING, date_created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_content_type (id INT, app_label STRING, model STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_migrations (id INT, app STRING, name STRING, applied TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_session (session_key STRING, session_data STRING, expire_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS django_site (id INT, domain STRING, name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS doc_amendment_products (id INT, doc_amendment_id INT, com_doc_id INT, product_id INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, new_unit_cost DECIMAL, new_quantity DECIMAL, new_total DECIMAL, old_unit_cost DECIMAL, old_quantity DECIMAL, old_total DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, new_pi_indent_id INT, old_pi_indent_id INT, carton_quantity DECIMAL, carton_capacity DECIMAL, carton_loose_pcs DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS doc_amendments (id INT, com_doc_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, note STRING, old_amount DECIMAL, new_amount DECIMAL, new_lc_type INT, new_lc_no STRING, new_sc_no STRING, new_party_id INT, new_ref_party_id INT, new_lc_tolerance DECIMAL, new_lc_margin DECIMAL, new_advising_bank_id INT, new_lc_tenor INT, new_partial_shipment INT, new_cnf_id INT, new_transshipment STRING, new_third_party_id INT, new_currency STRING, new_exchange_rate DECIMAL, new_payment_terms INT, old_lc_type INT, old_lc_no STRING, old_sc_no STRING, old_party_id INT, old_ref_party_id INT, old_lc_tolerance DECIMAL, old_lc_margin DECIMAL, old_advising_bank_id INT, old_lc_tenor INT, old_partial_shipment INT, old_cnf_id INT, old_transshipment STRING, old_third_party_id INT, old_currency STRING, old_exchange_rate DECIMAL, old_payment_terms INT, new_applicant_bank_id INT, old_applicant_bank_id INT, new_bank_id INT, amendment_no STRING, old_bank_id INT) PARTITIONED BY (amendment_date DATE, new_lc_opening_date DATE, new_lc_expiry_date DATE, new_shipment_expiry_date DATE, old_lc_opening_date DATE, old_lc_expiry_date DATE, old_shipment_expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS document_tags (id INT, tag STRING, document_id INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS document_users (id INT, document_id INT, user_id INT, created TIMESTAMP, created_by INT, deleted TINYINT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS documents (id INT, name STRING, path STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT, version INT, deleted TINYINT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS docx_template_types (id INT, template_name STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, module_id INT, type INT, google_doc_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_employees (id INT, employee_id INT, employee_name_eng STRING, employee_name_bng STRING, nid STRING, office_id INT, office_unit_id INT, office_name_bn STRING, office_name_en STRING, unit_name_bn STRING, unit_name_en STRING, designation_id INT, designation_eng STRING, designation_bng STRING, user_id INT, username STRING, user_image STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_geo_districts (id INT, geo_district_id INT, district_name_bng STRING, district_name_eng STRING, bbs_code STRING, division_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_geo_divisions (id INT, geo_division_id INT, division_name_bng STRING, division_name_eng STRING, bbs_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_geo_unions (id INT, geo_union_id INT, union_name_bng STRING, union_name_eng STRING, bbs_code STRING, upazila_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_geo_upazilas (id INT, geo_upazila_id INT, upazila_name_bng STRING, upazila_name_eng STRING, bbs_code STRING, district_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_ministries (id INT, name_eng STRING, name_bng STRING, name_eng_short STRING, reference_code STRING, office_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_ministry_layers (id INT, layer_name_bng STRING, layer_name_eng STRING, parent_layer_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_office_origins (id INT, office_name_bng STRING, office_name_eng STRING, office_ministry_id INT, office_layer_id INT, parent_office_id INT, office_level INT, office_sequence INT, office_layer STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_offices (id INT, office_name_bng STRING, office_name_eng STRING, geo_division_id INT, geo_district_id INT, geo_upazila_id INT, digital_nothi_code STRING, office_phone STRING, office_mobile STRING, office_fax STRING, office_email STRING, office_web STRING, office_ministry_id INT, office_layer_id INT, office_origin_id INT, custom_layer_id INT, parent_office_id INT, office_layer_name_eng STRING, office_layer_name_bng STRING, office_layer STRING, is_customer INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS doptor_outgoing_apis (id INT, name STRING, endpoint STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS draft_all_employee_schedules (id INT, employee_id INT, schedule_id INT, salary_amount DECIMAL, total_amount DECIMAL, paid_amount DECIMAL, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS draft_all_payroll_schedules (id INT, name STRING, print_as STRING, frequency_type INT, type INT, status INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, parent_id INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE, check_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS draft_all_payscale_data (id INT, payroll_item_id INT, payscale_id INT, schedule_id INT, employee_schedule_id INT, employee_id INT, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS draft_ledgers (id INT, voucher_id INT, account_id INT, amount DECIMAL, party_id INT, party_role_id INT, custom_field_1 STRING, src_currency STRING, src_amount DECIMAL, party_currency STRING, party_amount DECIMAL) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS early_out_adjustments (id INT, code STRING, employee_leave_id INT, employee_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, own_approval INT, transaction_id INT, remarks STRING) PARTITIONED BY (adjustment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ecr_forms (id INT, name STRING, inactive INT, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS ecr_options (id INT, question_id INT, name STRING, value INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ecr_question_forms (id INT, question_id INT, form_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ecr_questions (id INT, name STRING, type INT, attachment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS electric_meters (id INT, service_type_id INT, meter_type_id INT, distribution_phase INT, meter_name STRING, model STRING, manufacturer STRING, nominal_voltage STRING, max_voltage STRING, frequency STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (warranty_start DATE, warranty_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_exam_link (id INT, employee_id INT, topic_id INT, question_id STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, status INT, exam_start_time TIMESTAMP) PARTITIONED BY (validate_till DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_exam_record_details (id INT, exam_id STRING, question_id INT, selected_option INT, para_answer STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_exam_records (id INT, employee_id INT, department_id INT, designation_id INT, mcq_mark DECIMAL, paragraph_mark DECIMAL, total_mark DECIMAL, topic_id INT, module_id INT, result INT, has_paragraph INT, has_mcq INT, start_time TIMESTAMP, end_time TIMESTAMP, submission_time TIMESTAMP, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, accepted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_modules (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_options (id INT, name STRING, question_id INT, correct_answer INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_questions (id INT, name STRING, type INT, topic_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS elm_topics (id INT, name STRING, code STRING, module_id INT, thumbnail_id INT, resource_id INT, total_mark DECIMAL, total_question DECIMAL, pass_mark DECIMAL, exam_duration INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, validate_days INT, auto_certificate_issue INT, certificate_issuer_company_name STRING, certificate_issuer_company_moto STRING, certificate_issuer_person_name STRING, certificate_issuer_person_designation STRING, validity_time_limit INT, signature_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS email_addresses (id INT, email STRING, is_verified TINYINT, inactive TINYINT, deleted TINYINT, verification_code STRING, token_expiry_time TIMESTAMP, token STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS email_templates (id INT, name STRING, class_name STRING, receiver_template STRING, subject_template STRING, message_template STRING, attachment_template STRING, outline STRING, event STRING, enabled TINYINT, config_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, bcc_template STRING, cc_template STRING, sub_event STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS emails (id INT, table_name STRING, table_key INT, subject STRING, from_email STRING, `to` STRING, cc STRING, bcc STRING, body STRING, error TIMESTAMP, error_details STRING, sent TIMESTAMP, server_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, config_id STRING, sender_name STRING, deleted TINYINT, message_id STRING, thread_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS emi_configurations (id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, sub_category_0_id INT, sub_category_1_id INT, sub_category_2_id INT, sub_category_3_id INT, product_id INT, emi_config STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS emi_schedules (id INT, loan_id INT, balance DECIMAL, interest DECIMAL, principal DECIMAL, is_paid TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, voucher_id INT, order_id INT, type INT, parent_id INT, amount DECIMAL, interest_waived INT, voucher_id_list STRING) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS emp_payroll_schedule_status (id INT, employee_id INT, all_payroll_schedule_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS emp_product_targets (id INT, sales_target_id INT, employee_target_id INT, manufacturer_id INT, product_id INT, target DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, employee_id INT, quantity DECIMAL, product_price DECIMAL, commission_rate DECIMAL, achievement_price DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_assets (id INT, employee_id INT, assemble_product_id INT, product_id INT, status INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_claimed_insurances (id INT, insurance_no STRING, employee_id INT, insurance_type_id INT, insurance_company STRING, amount DECIMAL, premium DECIMAL, claim_amount DECIMAL, tenure DECIMAL, purpose STRING, family_member_id INT, attachment_id INT, status INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (apply_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_closing_applications (id INT, employee_id INT, subject STRING, instant_closing TINYINT, type INT, cause STRING, termination_type INT, termination_by INT, retirement_type INT, status INT, status_comments STRING, recommend_by INT, recommend_comment STRING, approved_by INT, approved_comment STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT) PARTITIONED BY (application_date DATE, effect_date DATE, recommend_date DATE, recommended_effect_date DATE, approved_date DATE, approved_effect_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_confidential_report_details (id INT, ecr_id INT, employee_id INT, scorer_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, question_id INT, option_id INT, value INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_confidential_report_scores (id INT, ecr_id INT, employee_id INT, scorer_id INT, total_score DECIMAL, status INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_confidential_reports (id INT, name STRING, form_id INT, status INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, employee_id INT, code STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_evaluation (id INT, employee_id INT, communication INT, interpersonal INT, decision_making INT, leadership INT, listening INT, updated TIMESTAMP, created_by INT, created TIMESTAMP, comments STRING, status INT, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_family_members (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, relation STRING, employee_id INT, blood_group STRING, gender INT, nid STRING, age STRING, phone STRING, birth_certificate_number STRING, address STRING, marital_status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_final_settlement_amounts (id INT, final_settlement_id INT, item_id INT, name STRING, type INT, quantity DECIMAL, rate DECIMAL, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_final_settlement_assets (id INT, final_settlement_id INT, item STRING, name STRING, purpose STRING, project STRING, issued_quantity DECIMAL, returned_quantity DECIMAL, status INT, receive_by INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (assign_date DATE, receive_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_final_settlements (id INT, employee_closing_application_id INT, payroll_earning_id INT, payroll_payment_id INT, total_addition_amount DECIMAL, total_deduction_amount DECIMAL, net_payable_amount DECIMAL, status INT, voucher_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_group (id INT, code STRING, name STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_holidays (id INT, employee_id INT, alternate_holiday_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (holiday DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_insurance_types (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_insurances (id INT, insurance_no STRING, employee_id INT, insurance_type_id INT, insurance_company STRING, amount DECIMAL, premium DECIMAL, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, is_batch INT, tenure DECIMAL, attachment_id INT, family_member_id INT) PARTITIONED BY (apply_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_leave_bills (id INT, leave_id INT, employee_id INT, payroll_earning_id INT, payroll_payment_id INT, billable_days DECIMAL, rate DECIMAL, amount DECIMAL, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_leaves (id INT, leave_type_id INT, employee_id INT, type INT, comment STRING, is_emergency INT, maternity_status INT, total_days DECIMAL, approved_days DECIMAL, deduction_rate DECIMAL, revised TINYINT, status INT, approved_by INT, recommended_by INT, rejected_by INT, canceled_by INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, version INT, deleted TINYINT, location STRING, own_approval INT, transaction_id INT, half_day INT, quarter_info INT, `start` TIMESTAMP, `end` TIMESTAMP, leave_reliever INT, country_id INT, is_overseas INT, is_mandatory INT, is_station INT, considered INT, schedule_id INT, reason STRING) PARTITIONED BY (entry_date DATE, from_date DATE, to_date DATE, baby_born_date DATE, approved_to DATE, approved_from DATE, compensatory_on DATE, noc_date DATE, cancel_date DATE, approve_date DATE, reject_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_ledgers (id INT, department_id INT, cost_segment_id INT, account_id INT, contra_account_id INT, journal_id INT, voucher_id INT, employee_id INT, employee_schedule_id INT, payroll_schedule_id INT, payroll_earning_id INT, payroll_payment_id INT, payroll_item_id INT, loan_id INT, loan_schedule_id INT, loan_repayment_id INT, bank_id INT, account_number STRING, reason INT, amount DECIMAL, partial_amount DECIMAL, partial_view TINYINT, balance DECIMAL, description STRING, branch_id INT, inactive TINYINT, deleted TINYINT, movement_register_id INT, payment_method INT, show_in_payslip INT, source_schedule INT, subschedule_id INT, system_generated INT, currency_rate DECIMAL, employee_account_detail_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_level (id INT, name STRING, code STRING, description STRING, branch_head INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, parent_id INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_meal_history (id INT, employee_id INT, meal INT, guest_meal INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_meals (id INT, employee_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_meals_applications (id INT, employee_id INT, type INT, status INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, transaction_id INT, own_approval INT) PARTITIONED BY (action_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_notices (id INT, employee_id INT, type TINYINT, termination_id INT, cause STRING, signed_by INT, employee_replay STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (sent_date DATE, employee_received_date DATE, employee_replay_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_outlines (id INT, label STRING, code STRING, nick_name TINYINT, birth_certificate_No TINYINT, birth_place TINYINT, age TINYINT, national_ID TINYINT, ad_username TINYINT, maritial_status TINYINT, code_prefix TINYINT, birthday TINYINT, card_id TINYINT, e_tin TINYINT, phone TINYINT, alt_phone TINYINT, mobile TINYINT, alt_mobile TINYINT, email TINYINT, alt_email TINYINT, gender TINYINT, disabled_employee TINYINT, probation_period TINYINT, probation_end_period TINYINT, confirmation_date TINYINT, paid_upto TINYINT, release_date TINYINT, liability_update TINYINT, notice_period_days TINYINT, accomodations TINYINT, job_location TINYINT, employee_leave TINYINT, supervisor_manager TINYINT, salary_payment_unit TINYINT, category TINYINT, position TINYINT, pieceworker TINYINT, office_car TINYINT, roster TINYINT, ot_registered TINYINT, pf_contributor TINYINT, field_force TINYINT, description TINYINT, appraisal_form TINYINT, appraisal_duration TINYINT, next_appraisal_date TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_payroll_data (id INT, employee_id INT, payroll_item_id INT, payscale_id INT, grade_id INT, amount DECIMAL, partial_amount DECIMAL, calculated_amount DECIMAL, min_amount DECIMAL, limit DECIMAL, is_refundable TINYINT, is_basic TINYINT, rounding_after INT, multiplier INT, divisor INT, calculation_type INT, partial_calculation_type INT, taxable INT, partial_view INT, tax_exemption_type_id INT, tax_setting_type_id INT, exemption_in_percent DECIMAL, exemption_max_amount DECIMAL, taxable_amount_in_percent DECIMAL, taxable_min_amount DECIMAL, accommodation_exemption_in_percent_of_paid_rent DECIMAL, include_in_salary DECIMAL, is_modified INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, `order` INT, employee_payscale_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_payscale_data (id INT, payroll_grade_data_id INT, employee_payscale_id INT, calculation_type INT, amount DECIMAL, rate DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_payscales (id INT, employee_id INT, payscale_id INT, updated_payscale_id INT, edit_type INT, appraisal_id INT, comment STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, use_timedata INT, updated_by INT, amount DECIMAL, taxable_percent DECIMAL, tax_amount DECIMAL, grade_id INT, basic_amount DECIMAL, gross_amount DECIMAL, total_flat_amount DECIMAL, multiply_factor DECIMAL, total_addition DECIMAL, total_deduction DECIMAL, net_amount DECIMAL, previous_payscale_id INT, previous_amount DECIMAL, previous_gross_amount DECIMAL, override_payroll_config INT, cash_amount DECIMAL, payscale_grades_slab_details_id INT, payscale_grades_slab_id INT) PARTITIONED BY (`start` DATE, `end` DATE, effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_payscales_temporary (id INT, employee_id INT, payscale_id INT, updated_payscale_id INT, edit_type INT, appraisal_id INT, comment STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, use_timedata INT, updated_by INT, amount DECIMAL, taxable_percent DECIMAL, tax_amount DECIMAL, grade_id INT, basic_amount DECIMAL, gross_amount DECIMAL, total_flat_amount DECIMAL, multiply_factor DECIMAL, total_addition DECIMAL, total_deduction DECIMAL, net_amount DECIMAL, previous_payscale_id INT, previous_amount DECIMAL, previous_gross_amount DECIMAL, data STRING, status INT, transaction_id INT, override_payroll_config INT, change_type INT, impacted INT, designation_id INT, schedule_id INT, payscale_grades_slab_details_id INT, payscale_grades_slab_id INT, from_position_index_id INT, position_type INT, to_position_index_id INT, to_position_index_type INT) PARTITIONED BY (`start` DATE, `end` DATE, effective_date DATE, application_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_performance_appraisal_details (id INT, appraisal_id INT, appraiser_id INT, criteria_id INT, rating_point_id INT, rating_points DECIMAL, criteria_weightage DECIMAL, weightage_rating_point DECIMAL, notes STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, criteria_rating_point_id INT, criteria_wise_weighted_rating DECIMAL, appraiser_wise_weighted_rating DECIMAL, reveiwed_rating DECIMAL, weightage_reveiwed_rating DECIMAL, reveiwed_by INT, is_submitted INT, achievement_quantitive DECIMAL, reviewed_rating_point_id INT, reviewed_achievement_quantitive DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_performance_appraisals (id INT, title STRING, employee_id INT, outline_id INT, rating_system_id INT, total_points DECIMAL, weightage_average DECIMAL, rating_points_average DECIMAL, rating_parcentage_average DECIMAL, resulting_rating_point_id INT, status INT, verifier_id INT, approver_id INT, preferred_action_id INT, employment_branch_id INT, designation_id INT, department_id INT, manager_1 INT, manager_2 INT, payscale_id INT, previous_employment_branch_id INT, previous_designation_id INT, previous_department_id INT, previous_manager_1 INT, previous_manager_2 INT, previous_payscale_id INT, current_appraisal_duration INT, salary_increment INT, increment_amount DECIMAL, proposed_salary DECIMAL, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, is_partial INT, parent_id INT, frequency_type INT, frequency_value STRING, appraisal_type INT, own_approval INT, transaction_id INT, employee_wise_outline_id INT, comment STRING, locked INT, appraisal_scope INT, is_submitted INT) PARTITIONED BY (`date` DATE, next_appraisal_date DATE, effective_date DATE, expire_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_performance_appraiser_wise_ratings (id INT, appraisal_id INT, appraiser_id INT, criteria_id INT, rating_point_id INT, achievement_quantitive DECIMAL, is_submitted INT, remarks STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_performance_appraisers (id INT, pointing_level_id INT, employee_id INT, pointing_level_name STRING, appraiser_id INT, weightage DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, type INT, hierarchical_order INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_positions (id INT, employee_id INT, position_index_id INT, created_by INT, updated_by INT, type INT, inactive INT, deleted INT, supervisor_position_id INT, manager_position_id INT, is_approver INT, is_recommender INT) PARTITIONED BY (`start` DATE, `end` DATE, created DATE, updated DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_public_info (id INT, employee_id INT, employee_code STRING, office_email STRING, fax STRING, pabx STRING, is_public INT, designation_id INT, department_id INT, phone STRING, inactive INT, blood_group INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_purchase_items (id INT, employee_id INT, employee_code STRING, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (purchase_month_start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_qualifications (id INT, type INT, employee_id INT, degree_level INT, trained_level INT, degree_name STRING, training_name STRING, training_id INT, company_name STRING, passing_year INT, position STRING, duration_in_year INT, duration_in_month INT, duration_in_days INT, duration_in_hr INT, major_subject STRING, result STRING, board_university_id INT, certificate_authority STRING, responsibilities STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, location STRING, arranged_by STRING, is_highest INT, description STRING, board_university STRING, board STRING, exam_id INT, experience_type INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_reference (id INT, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_sale_targets (id INT, target_id INT, employee_id INT, target INT, commission DECIMAL, created_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_sap (id INT, employee_id INT, company_code STRING, cost_center_code STRING, profit_center_code STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_schedules (id INT, employee_id INT, schedule_id INT, comment STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_separation_by_types (id INT, name STRING, inactive INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_separation_types (id INT, name STRING, inactive INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_session (id INT, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_setting (id INT, employment_type INT, shift_schedule INT, leave_policy INT, branch INT, department INT, designation INT, payscale INT, payroll_schedule INT, description STRING, updated TIMESTAMP, updated_by INT, name STRING, created_by INT, created TIMESTAMP) PARTITIONED BY (date_hired DATE, paid_upto DATE, release_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_specialization (id INT, employee_id INT, term_id INT, productivity DECIMAL, comments STRING, inactive TINYINT, deleted TINYINT, specialization_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, performance_id INT, priority_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_targets (id INT, sales_target_id INT, employee_id INT, manager_1_id INT, manager_2_id INT, manager_3_id INT, total_target DECIMAL, division_id INT, city_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, sales_commission_id INT, min_required_achievement DECIMAL, is_month_end INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_tax_submission_return (id INT, employee_id INT, year INT, attachment_id INT, deleted INT, inactive INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_tax_submissions (id INT, department_id INT, branch_id INT, designation_id INT, shift_schedule_id INT, status INT, description STRING, submission_number STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, challan_no STRING, account_id INT, contra_account_id INT, bank_id INT) PARTITIONED BY (entry_date DATE, from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_transfer_requisitions (id INT, employee_id INT, branch_id INT, dest_branch_id INT, project_id INT, dest_project_id INT, department_id INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, dest_department_level_2 INT, dest_department_level_3 INT, dest_department_level_4 INT, dest_department_id INT, code STRING, status INT, created_by INT, approved_by INT, updated_by INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, own_approval INT, transaction_id INT, holiday_policy_id INT, dest_holiday_policy_id INT, leave_policy_id INT, dest_leave_policy_id INT, shift_schedule_id INT, dest_shift_schedule_id INT, job_location_id INT, dest_job_location_id INT, salary_location_id INT, dest_salary_location_id INT, designation_id INT, dest_designation_id INT, payroll_schedule_id INT, dest_payroll_schedule_id INT, department_level_5 INT, department_level_6 INT, dest_department_level_5 INT, dest_department_level_6 INT, employee_code STRING) PARTITIONED BY (application_date DATE, effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_transfers (id INT, employee_id INT, branch_id INT, dest_branch_id INT, project_id INT, dest_project_id INT, department_id INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, dest_department_level_2 INT, dest_department_level_3 INT, dest_department_level_4 INT, dest_department_id INT, code STRING, status INT, created_by INT, approved_by INT, updated_by INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, own_approval INT, transaction_id INT, holiday_policy_id INT, dest_holiday_policy_id INT, leave_policy_id INT, dest_leave_policy_id INT, shift_schedule_id INT, dest_shift_schedule_id INT, job_location_id INT, dest_job_location_id INT, salary_location_id INT, dest_salary_location_id INT, designation_id INT, dest_designation_id INT, payroll_schedule_id INT, dest_payroll_schedule_id INT, department_level_5 INT, department_level_6 INT, dest_department_level_5 INT, dest_department_level_6 INT, employee_code STRING, employee_transfer_requisition_id INT, requisition_code STRING, from_position_index_id INT, to_position_index_id INT, to_position_index_type INT, to_mail_employee_list STRING, approver_mail_employee_list STRING, verifier_mail_employee_list STRING, employment_type INT, prev_employment_type INT, prev_employee_code STRING) PARTITIONED BY (application_date DATE, effective_date DATE, release_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_transportation_driver (id INT, fleet_registration_id INT, fleet_group_id INT, fleet_request_id INT, driver_id INT, status INT, start_trip TIMESTAMP, end_trip TIMESTAMP, completion_trip TIMESTAMP, fleet_request_number STRING, fleet_id INT, assign_person INT, trip_number STRING) PARTITIONED BY (approval_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employee_wise_criteria_rating_level (id INT, employee_id INT, criteria_id INT, rating_system_id INT, rating_name STRING, rating_label STRING, code INT, employee_wise_outline_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employees (id INT, employee_code STRING, birth_certificate_number STRING, card_id STRING, description STRING, manager_1 INT, manager_2 INT, appraisal_form_id INT, appraisal_duration INT, doctor_recommendation STRING, educational_qualifications STRING, experience_outside_company STRING, reference STRING, release_comment STRING, resignation_comment STRING, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, custom_field_6 STRING, fingerprint_1 STRING, fingerprint_2 STRING, shift_sequence STRING, completion_status INT, disabled TINYINT, notice_period INT, appraisal_frequency INT, salary_cycle_id INT, employee_wise_appraisal_form_id INT, birth_district STRING, visa_no STRING, is_disable INT, disable_purpose STRING, language INT, is_pieceworker INT, secondary_form_id INT, employee_wise_secondary_form_id INT, appraisal_secondary_frequency INT, appraisal_secondary_duration INT, ad_username STRING, salary_held_up INT, inactive_unnoticed INT, is_restricted_payment_info TINYINT, is_nightbill INT, is_tiffinbill INT, is_doublemachine INT, is_nightbill2 INT, is_shiftallowance INT, payslip_email STRING) PARTITIONED BY (`start` DATE, confirmation_date DATE, `end` DATE, liability_update_date DATE, clear_date DATE, release_date DATE, next_appraisal_date DATE, resignation_date DATE, inactive_date DATE, recruitment_date DATE, probation_end DATE, offer_date DATE, appointment_date DATE, visa_expiry_date DATE, date_of_expiry DATE, issue_date DATE, next_secondary_appraisal_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS employment_types (id INT, label STRING, prefix STRING, is_system_generated INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS employments (id INT, employee_code STRING, card_id STRING, manager_1 INT, manager_2 INT, employment_branch_id INT, designation_id INT, department_id INT, class_id INT, employment_type INT, shift_schedule_id INT, leave_policy_id INT, pay_grade STRING, employee_id INT, holiday_policy_id INT, provision_period INT, appraisal_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, group_id INT, accommodation_type INT, employee_paid_hrent DECIMAL, office_car TINYINT, job_location_id INT, is_roster TINYINT, is_pf TINYINT, pf_opening_balance DECIMAL, description STRING, pf_type INT, salary_location_id INT, is_ot TINYINT, field_force INT, employee_level_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, department_level_7 INT, department_level_8 INT, department_level_9 INT, department_level_10 INT, designation_level_id INT, department_detail_id_1 INT, department_detail_id_2 INT, department_detail_id_3 INT, department_detail_id_4 INT, department_detail_id_5 INT, department_detail_id_6 INT, department_detail_id_7 INT, department_detail_id_8 INT, department_detail_id_9 INT, department_detail_id_10 INT, current_roster_shift INT, roster_alter_frequency INT, roster_shift_list STRING, is_restricted_payment_info TINYINT, prev_opening_balance DECIMAL, designation2_id INT, under_delegation_manager_1 INT, under_delegation_manager_2 INT, employee_session_id INT, pf_unique_number STRING) PARTITIONED BY (`start` DATE, `end` DATE, pf_start DATE, pf_end DATE, estimated_end DATE, last_altered_shift_roster DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS en_notification_groups (id INT, module_id INT, user_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS en_notifications (id INT, title STRING, type INT, `group` INT, group_data STRING, notification_data STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, source STRING, key STRING, action STRING, actor STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS en_push_clients (id INT, user_id INT, client_data STRING, client_type INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, checksum INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS en_user_notifications (id INT, user_id INT, notification_id INT, seen INT, expires_at TIMESTAMP, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS enquiry_status_histories (id INT, enquiry_id INT, prev_status INT, present_status INT) PARTITIONED BY (change_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS equity_parties (id INT, account_id INT, party_id INT, no_of_share INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS exchange_rates (id INT, src_currency STRING, dest_currency STRING, rate DECIMAL, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS exit_clearance_items (id INT, exit_clearance_id INT, department_1_id INT, assigned_to INT, department_2_id INT, department_3_id INT, department_4_id INT, item_text STRING, status INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, comment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS exit_clearance_template_items (id INT, template_id INT, department_1_id INT, assigned_to STRING, department_2_id INT, department_3_id INT, department_4_id INT, item_text STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS exit_clearance_templates (id INT, name STRING, reason STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS exit_clearances (id INT, employee_id INT, reason STRING, ref_id STRING, template_id INT, status INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (last_working_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS expense_purposes (id INT, name STRING, description STRING, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, created_at TIMESTAMP, updated_at TIMESTAMP, account_id INT, code STRING, calculation_method INT, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS export_lc_couriers (id INT, lc_id INT, name STRING) PARTITIONED BY (maturity_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS export_lc_documents (id INT, lc_id INT) PARTITIONED BY (received_date DATE, lading_date DATE, invoice_date DATE, eta_date DATE, etd_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS export_lcs (id INT, lc_number STRING, pi_num STRING, order_number STRING, percentage DECIMAL, bank_id INT, group_id INT, applicant_bank_id INT, draft_at INT, buyer_lc_num STRING, buyer_lc_date STRING, hs_code STRING, bb_ref STRING, vendor_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS export_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, additional_weight INT, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS extra_style_qualities (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fabric_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS factories (id INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS features (id INT, name STRING, unit_of_measurement_id INT, datatype STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS file_import_outlines (id INT, module_name STRING, model_name STRING, service_name STRING, column_mapping STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS files (id INT, file_no STRING, file_name STRING, volume STRING, type STRING, department_id INT, description STRING, status INT, party_id INT, current_department_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (date_of_opening DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS files_traverse (id INT, department_from INT, department_to INT, description STRING, attention STRING, forwarded_by STRING, file_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, forwarded_to INT, forwarded_to_external STRING, movement_type_id INT, organization_name STRING, received_by STRING, status INT) PARTITIONED BY (`date` DATE, received_by_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS final_shipment_schedules (id INT, tent_shipment_schedule_id INT, pi_id INT, ci_id INT, total_containers INT, no_of_container INT, port_assessment_days INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (factory_dispatch_date DATE, document_date DATE, shipping_date DATE, document_release_date DATE, landing_date_port DATE, landing_date_wh DATE, assessment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS financial_doc_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, account_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS financial_docs (id INT, routing_type INT, financial_doc_type INT, cheque_date TIMESTAMP, cheque_number STRING, account_id INT, contra_account_id INT, maturity_account_id INT, maturity_contra_account_id INT, return_account_id INT, return_contra_account_id INT, accounting_treatment INT, voucher_id INT, expense_margin DECIMAL, party_type STRING, payment_method INT, receipt_book_id INT, receipt_book_leaf_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS financial_loan_outlines (id INT, name STRING, panel_interest TINYINT, loan_type TINYINT, circular_interest_calculation TINYINT, calculation_policy TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS financial_loans (id INT, outline_id INT, name STRING, account_id INT, loan_no STRING, description STRING, ref_no STRING, calculation_frequency INT, interest_rate DECIMAL, panel_interest_rate DECIMAL, panel_free_days INT, deleted TINYINT, inactive TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, src_currency STRING, src_amount DECIMAL, amount DECIMAL, exchange_rate DECIMAL, base_account_id INT, interest_account_id INT, base_src_amount DECIMAL, interest_src_amount DECIMAL, base_amount DECIMAL, interest_amount DECIMAL, import_lc_id INT) PARTITIONED BY (entry_date DATE, applicable_date DATE, end_date DATE, pad_start DATE, pad_end DATE, ltr_start DATE, ltr_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS finished_product_receive (id INT, production_planning_id INT, production_id INT, production_step_id INT, workorder_id INT, quantity_assumed DECIMAL, quantity_received DECIMAL, product_id INT, finished_product_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fixed_cost (id INT, name STRING, amount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet (id INT, name STRING, fleet_group_id INT, section1 STRING, section2 STRING, section3 STRING, section4 STRING, inactive TINYINT, product_id INT, registration_no STRING, status INT, fleet_order INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_accident_info (id INT, fleet_group_id INT, fleet_registration_id INT, accident_place STRING, note STRING, fleet_schedule_id INT, deleted TINYINT) PARTITIONED BY (accident_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_additional_info (id INT, fleet_registration_id INT, fuel_type_id INT, additional_fuel_type_id INT, mileage DECIMAL, notify_renewal_date INT, odometer_type INT, odometer_activation INT, year STRING, make STRING, sitting_capacity INT, engine_number STRING, no_of_cylinders INT, tare DECIMAL, manufacturer DECIMAL, engine_capacity DECIMAL, rwc_no STRING, tester_license_no STRING, vehicle_condition INT, transmission INT, engine_type INT, left_hand_drive INT, hybrid INT, air_condition INT, note STRING, chassis_no STRING, color STRING, model_no STRING, owner_id INT, reg_no STRING, key_no STRING, manufacturer_id INT, model_id INT, battery_brand_id INT, battery_size STRING, tyre_brand_id INT, tyre_size STRING, total_mileage DECIMAL, branch_id INT, fleet_group_id INT, warranty_mileage DECIMAL, branch_name STRING, owner_gid INT, is_posted INT, branch_code STRING, actual_branch_id INT, data_source STRING, is_gvs_module_on INT) PARTITIONED BY (renewal_date DATE, issue_date DATE, warranty_start_date DATE, warranty_end_date DATE, ownership_start DATE, ownership_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_asset_vehicle_info (id INT, internal_product_serial_id INT, wo_no STRING, vin_no STRING, plate_no STRING, fuel_type_id INT, odometer_type INT, mileage DECIMAL, odometer_activation DECIMAL, note STRING, make STRING, sitting_capacity INT, engine_number STRING, no_of_cylinders INT, tare DECIMAL, manufacturer DECIMAL, engine_capacity DECIMAL, rwc_no STRING, tester_license_no STRING, vehicle_condition INT, transmission INT, engine_type INT, left_hand_drive INT, hybrid INT, air_condition INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (renewal_date DATE, issue_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_backup_fleet_list (id INT, fleet_schedule_id INT, fleet_registration_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_bank_info (id INT, fleet_registration_id INT, bank_id INT, total_amount DECIMAL, paid_amount DECIMAL, due_amount DECIMAL, monthly_pay_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_bill_generation (id INT, name STRING, outline_id INT, parent_id INT, status INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_bill_generation_details (id INT, bill_generation_id INT, fleet_contracts_id INT, amount DECIMAL, voucher_id INT, party_id INT, fleet_schedule_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_bill_generation_outline (id INT, duration INT, name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_category (id INT, name STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_contracts (id INT, contract_id INT, contract_type INT, fleet_registration_id INT, fleet_doc_id INT, fleet_doc_type STRING, fleet_schedule_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_crm_activity_mappings (id INT, fleet_id INT, activity_id INT, schedule_id INT, job_id INT, activity_purpose INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_driver (id INT, fleet_group_id INT, fleet_registration_id INT, note STRING, employee_id INT, location STRING, name STRING) PARTITIONED BY (reg_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_employee_group (id INT, fleet_rout_id INT, group_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_employee_group_details (id INT, fleet_employee_group_id INT, fleet_rout_details_id INT, employee_id INT, department_id INT, fleet_rout_city_id INT, fleet_rout_thana_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_fitness_info (id INT, fleet_registration_id INT, fitness_note STRING, notify_fitness_expires_on INT) PARTITIONED BY (issue_date DATE, expire_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_fuel (id INT, fleet_group_id INT, fleet_registration_id INT, refill_unit INT, unit_cost DECIMAL, total_cost DECIMAL, fuel_type_id INT, deleted TINYINT, note STRING, remaining_adv STRING, odo_before_filing DECIMAL, ending_odo DECIMAL, mileage DECIMAL, employee_id INT) PARTITIONED BY (refill_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_fuel_type (id INT, name STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_group (id INT, name STRING, inactive INT, item_id INT, seat_capacity INT, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_income_info (id INT, fleet_registration_id INT, type INT, rate DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_inspection_info (id INT, fleet_registration_id INT, reference STRING, notify_next_inspection_on INT, note STRING) PARTITIONED BY (last_inspection_on DATE, next_inspection_on DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_inspection_notification (id INT, fleet_registration_id INT, fleet_inspection_info_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_insurance_expire_notification (id INT, fleet_registration_id INT, fleet_insurance_info_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_insurance_info (id INT, fleet_registration_id INT, insurer STRING, insurance_company STRING, reference STRING, notify_insurance_expires_on INT, insurance_note STRING, license_no STRING, notify_license_expires_on INT, license_note STRING) PARTITIONED BY (insurance_date DATE, insurance_expires_on DATE, license_date DATE, license_expires_on DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_insurance_license_expire_notification (id INT, fleet_registration_id INT, fleet_insurance_info_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_lease_agreement_expire_notification (id INT, fleet_registration_id INT, lease_agreement_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_lease_agreement_info (id INT, fleet_registration_id INT, billing_type INT, billing_amount DECIMAL, agreement_no STRING, agreement_amount DECIMAL, notify_activate_till INT, note STRING, status INT) PARTITIONED BY (agreement_date DATE, activate_from DATE, activate_till DATE, next_payment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_on_duty (id INT, fleet_request_id INT, fleet_group_id INT, fleet_registration_id INT, location_from INT, location_to INT, duty_note STRING, employee_id INT, duty_purpose INT, department_id INT, shipment_id INT, schedule_start_time STRING, schedule_end_time STRING, customer_id INT, mobile_number STRING, package_id INT, agreement_no STRING, notify_agreement_end_date INT, agreement_type INT, agreement_amount DECIMAL, booking_days INT, down_payment_rcv DECIMAL, due_billing_amount DECIMAL, notify_next_due_date INT, customer_note STRING, status INT, sub_location_from STRING, sub_location_to STRING, package_price DECIMAL, discount DECIMAL, sub_total DECIMAL, total_agreement_days INT, due_amount DECIMAL, billing_days INT, schedule_type INT, fleet_rout_id INT, fleet_employee_group_id INT, is_hide_info INT, backup_status INT, outline_id INT, total_hours DECIMAL, extra_hours DECIMAL, mileage DECIMAL) PARTITIONED BY (schedule_start_date DATE, schedule_end_date DATE, agreement_date DATE, agreement_end_date DATE, next_due_date DATE, billed_upto DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_on_duty_details (id INT, fleet_schedule_id INT, fleet_package_details_id INT, item_name STRING, amount DECIMAL, max_day INT, discount DECIMAL, total_amount DECIMAL, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_outlines (id INT, name STRING, code STRING, register_income INT, branch_information INT, fleet_insurance_and_licence_info INT, fleet_inspection_info INT, fleet_fitness_info INT, fleet_tax_ticket_info INT, fleet_route_permit_info INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_package (id INT, fleet_group_id INT, package_name STRING, package_type INT, max_hour_day DECIMAL) PARTITIONED BY (active_from DATE, expires_on DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_package_conditions (id INT, fleet_package_id INT, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_package_details (id INT, fleet_package_id INT, item_name STRING, amount DECIMAL, max_day INT, discount DECIMAL, total_amount DECIMAL, discount_type INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_package_extra_hour (id INT, fleet_package_id INT, item_name STRING, amount DECIMAL, discount DECIMAL, total_amount DECIMAL, discount_type INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_parts (id INT, fleet_registration_id INT, parts_requisition_id INT, manufacturer STRING, note STRING, service_charge DECIMAL, employee_id INT) PARTITIONED BY (use_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_parts_details (id INT, parts_id INT, parts_requisition_details_id INT, request_qty INT, receive_qty INT, unit_cost DECIMAL, total_cost DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_parts_requisition (id INT, requisition_type INT, requisition_level INT, branch_id INT, employee_id INT, requisition_number STRING, fleet_registration_id INT) PARTITIONED BY (entry_date DATE, expected_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_parts_requisition_details (id INT, parts_requisition_id INT, parts_code STRING, parts_description STRING, quantity INT, approve_quantity INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_pay_advance_driver (id INT, employee_id INT, advance_purpose INT, paid_amount DECIMAL, note STRING) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_registration (id INT, registration_number STRING, fleet_type INT, fleet_group_id INT, fleet_id INT, fleet_vin_no STRING, vendor_id INT, address STRING, notify_registration_expire_date INT, wo_no STRING, inactive TINYINT, plate_no STRING, licence_no STRING, fleet_sl_no INT, product_id INT, product_serial_id INT, seat_capacity INT, manufacturer STRING, vehicle_type INT, usage_type INT, status INT, branch_id INT, vechicle_type INT) PARTITIONED BY (registration_date DATE, registration_expire_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_registration_expire_notification (id INT, fleet_registration_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_renewal_date_notification (id INT, fleet_registration_id INT, fleet_additional_info_id INT, notification STRING, user_id INT, status INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_request (id INT, request_number STRING, request_type INT, department_id INT, employee_id INT, fleet_group_id INT, region STRING, status INT, `start` TIMESTAMP, `end` TIMESTAMP, duration DECIMAL, destination STRING, total_passenger INT, requester_contact STRING, route_id INT, pickup_location INT, drop_location INT, is_merged INT, request_merged_id INT, left_person INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, branch_id INT) PARTITIONED BY (request_date DATE, required_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_root (id INT, location_from STRING, location_to STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_root_details (id INT, fleet_root_id INT, sub_location STRING, pickup_time STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_route_permit_info (id INT, fleet_registration_id INT, route_permit_note STRING, notify_route_permit_expires_on INT) PARTITIONED BY (issue_date DATE, expire_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_route_wise_vehicles (id INT, route_id INT, fleet_registration_id INT, created_by INT, created_at TIMESTAMP, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_schedule_agreement_notification (id INT, fleet_schedule_id INT, notification STRING, status INT, user_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_schedule_dates (id BIGINT, fleet_schedule_id INT, start_time STRING, end_time STRING, status INT, mileage DECIMAL, total_hours DECIMAL, extra_hours DECIMAL) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_schedule_days (id INT, fleet_schedule_id INT, days INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_schedule_due_date_notification (id INT, fleet_schedule_id INT, notification STRING, status INT, user_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_schedule_fleet_list (id INT, fleet_schedule_id INT, fleet_registration_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_security_money_payment (id INT, fleet_registration_id INT, voucher_number STRING, payment_amount DECIMAL, return_policy INT, generate_invoice INT, note STRING, total_amount DECIMAL, paid_amount DECIMAL, due_amount DECIMAL, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_service_notification (id INT, fleet_registration_id INT, fleet_service_id INT, notification STRING, status INT, user_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_service_schedule (id INT, fleet_registration_id INT, fleet_services_id INT, notify_due_date INT, note STRING, employee_id INT, status INT, notify_next_due_date INT, paid_amount DECIMAL, service_from INT, fleet_id INT, service_package_id INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, job_id_list STRING, appointment_time STRING, is_posted INT) PARTITIONED BY (entry_date DATE, due_date DATE, done_date DATE, next_due_date DATE, service_date DATE, start_date DATE, end_date DATE, appointment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_services (id INT, name STRING, repeat_month INT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_settings (id INT, refundable INT, non_refundable INT, cash_bank_acc INT, notify_before_days INT, max_visual_day INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_tax_token_info (id INT, fleet_registration_id INT, tax_token_note STRING, notify_tax_token_expires_on INT) PARTITIONED BY (issue_date DATE, expire_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_transaction_management_process_items (id INT, process_id INT, voucher_id INT, order_item_id INT, product_id INT, fleet_id INT, fleet_vin INT, quantity DECIMAL, unit_cost DECIMAL, total DECIMAL, order_expense_purpose_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_transaction_management_processes (id INT, voucher_id INT, voucher_amount DECIMAL, income_amount DECIMAL, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, display_amount INT, type INT, branch_id INT, code STRING) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_trips (id INT, fleet_registration_id INT, fleet_driver_id INT, weight DECIMAL, wt_uom INT, starting_location STRING, destination STRING, milage STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (trip_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_vehicle_wise_drivers (id INT, fleet_registration_id INT, employee_id INT, name STRING, contact_no STRING, created_by INT, created_at TIMESTAMP, inactive INT, deleted INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_vehicle_wise_employees (id INT, fleet_registration_id INT, employee_id INT, fare_cost DECIMAL, created_by INT, created_at TIMESTAMP, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fleet_vouchers (id INT, voucher_id INT, voucher_type INT, voucher_subtype INT, fleet_registration_id INT, party_id INT, fleet_doc_id INT, fleet_doc_type STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_account_group_accounts (id INT, account_id INT, account_group_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_account_headers (id INT, name STRING, code STRING, type INT, account_type INT, account_sub_type_list STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, super_type STRING, include_income INT, income INT, note INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_categories (id INT, name STRING, code STRING, depth INT, parent_id INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_details (id INT, budget_id INT, detail_type INT, budget_category_id INT, budget_sub_category_id INT, budget_item_id INT, budget_amount DECIMAL, frequency INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_duration_change_history (id INT, budget_id INT, created_by STRING, created_at TIMESTAMP) PARTITIONED BY (prev_start_date DATE, prev_end_date DATE, extended_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_items (id INT, name STRING, code STRING, category_id INT, sub_category_id INT, association_type INT, associate_with INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, data_type INT, boq_amount_association INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_template (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_template_items (id INT, template_id INT, budget_category_id INT, budget_sub_category_id INT, budget_item_id INT, distribution_percent DECIMAL, distribution_weight DECIMAL, budget_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_budget_type (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_masterbudget_amendments (id INT, budget_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, budget_amount DECIMAL, prev_budget_amount DECIMAL, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fms_masterbudget_amendmentsdetails (id INT, amendment_id INT, budget_category_id INT, budget_sub_category_id INT, budget_item_id INT, budget_amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, prev_budget_amount DECIMAL, account_id INT, account_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fund_requisition (id INT, recommended_amount DECIMAL, approved_amount DECIMAL, budget_id INT, approved_by INT, recommended_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fund_requisition_items (id INT, requisition_id INT, purpose_id INT, project_id INT, cost_center_id INT, department_id INT, amount DECIMAL, description STRING, budget_category_id INT, budget_item_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS fund_requisition_purpose (id INT, account_id INT, name STRING, code STRING, print_as STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, deleted TINYINT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS generic_bill_requisitions (id INT, requisition_number STRING, type INT, status INT, employee_id INT, approved_by INT, unit_value DECIMAL, rate DECIMAL, inactive INT, deleted INT, updated TIMESTAMP, created TIMESTAMP, updated_by INT, created_by INT, own_approval INT, transaction_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS gf_contribution_slabs (id INT, name STRING, count_after INT, slab_start INT, slab_end INT, gf_percent DECIMAL, multiply_with INT, months_for_average INT, formula STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS gift_coupons (id INT, discount_percent DECIMAL, coupon_code STRING, coupon_barcode STRING, branch_id INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created TIMESTAMP, created_by INT, updated_by INT, status INT, description STRING, customer_id INT, order_id INT) PARTITIONED BY (valid_till DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS goals (id INT, name STRING, description STRING, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, source_type STRING, source_id INT, branch_id INT, start_date TIMESTAMP, end_date TIMESTAMP, type INT, status INT, available_departments STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS gpf_calculated_balances (id INT, employee_id INT, balance DECIMAL, interest_amount DECIMAL, interest_rate DECIMAL, type_id INT, entry_date STRING, total_installment_count INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS gpf_ob_interest_slabs (id INT, from_amount DECIMAL, to_amount DECIMAL, interest_rate DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS gpf_pf_deduction_interest_slabs (id INT, from_amount DECIMAL, to_amount DECIMAL, interest_rate DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS gpf_yearwiseemployee_openings (id INT, employee_id INT, entry_date STRING, opening_balance DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS gridcolumns (id INT, user_id INT, url STRING, views STRING, columns STRING, grid_id STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS groups (id INT, name STRING, module INT, page_list STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS gst_state_code (id INT, state_id INT, gst_code STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS gvs_customers (id INT, full_name STRING, phone STRING, mobile STRING, driving_license STRING, category_id INT, subtype INT, ownership_status INT, email STRING, gender INT, national_id STRING, birth_certificate_number STRING, spouse_name STRING, education STRING, is_posted INT, inactive INT, deleted INT) PARTITIONED BY (birthday DATE, marriage_day DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS gvs_id_generator (id INT, key STRING, value INT, status INT, end_value INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS histories (id INT, table_name STRING, table_key INT, data BINARY, modified BINARY, version INT, created TIMESTAMP, created_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS holiday_policies (id INT, name STRING, description STRING, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT, branch_id_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS holiday_types (id INT, frequency INT, name STRING, description STRING, holiday_policy_id INT, weekday INT, monthday INT, month INT, deleted INT, created_by INT, created TIMESTAMP, updated TIMESTAMP, updated_by INT) PARTITIONED BY (start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS holidays (id INT, holiday_type_id INT, frequency INT, holiday_policy_id INT, deleted INT, name STRING, updated TIMESTAMP, created_by INT, description STRING, updated_by INT, created TIMESTAMP, employee_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS house_furnishing_maturity_config_info (id INT, designation_id INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_budget_amendment_details (id INT, budget_id INT, amendment_id INT, category_id INT, center_id INT, amount DECIMAL, year STRING, month STRING, branch_id INT, dept_1_id INT, dept_2_id INT, dept_3_id INT, dept_4_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, department_id INT, employee_id INT, old_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_budget_amendments (id INT, budget_id INT, name STRING, status INT, type INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_center_budget_details (id INT, budget_id INT, category_id INT, center_id INT, amount DECIMAL, year STRING, month STRING, branch_id INT, dept_1_id INT, dept_2_id INT, dept_3_id INT, dept_4_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, dept_5_id INT, dept_6_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_center_budgets (id INT, master_id INT, detail_id INT, cost_center_id INT, branch_id INT, department_id INT, cost_segment_id INT, payroll_item_id INT, amount DECIMAL) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_center_details (id INT, cost_center_id INT, branch_id INT, department_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_center_summary (id INT, cost_center_budget_id INT, payroll_schedule_id INT, number_of_employees INT, salary_amount DECIMAL, gross_amount DECIMAL, total_addition DECIMAL, total_deduction DECIMAL, salary_payable DECIMAL, leave_without_pay_deduction DECIMAL, total DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_centers (id INT, name STRING, print_as STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_cost_segments (id INT, name STRING, type INT, payroll_item_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_detail_budgets (id INT, master_id INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_employeewise_budgets (id INT, budget_id INT, employee_id INT, category_id INT, center_id INT, amount DECIMAL, year STRING, month STRING, branch_id INT, dept_1_id INT, dept_2_id INT, dept_3_id INT, dept_4_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_master_budgets (id INT, name STRING, from_month INT, from_year INT, to_month INT, to_year INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hr_projects (id INT, project_id INT, ledger_month INT, description STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hrm_service_benefit_slab (id INT, service_benefit_id INT, service_year_from INT, service_year_to INT, calculation_on INT, multiplier_1 DECIMAL, multiplier_2 INT, divide_by DECIMAL, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, designation INT, employee_category INT, age_from INT, age_to INT, round INT, service_year_on INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS hrm_service_benefits (id INT, name STRING, code STRING, criteria INT, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, closing_type INT, separation_type INT, separation_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hs_code_tariffs (id INT, code STRING, country_id INT, description STRING, cd DECIMAL, sd DECIMAL, vat DECIMAL, ait DECIMAL, rd DECIMAL, atv DECIMAL, tti DECIMAL, exd DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS hs_codes (id INT, code STRING, country_id INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_brand (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_colors (id INT, color_name STRING, color_code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_connection_requisitions (id INT, connection_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_connectivity_type (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_customer_connections (id INT, name STRING, type INT, customer_id INT, service_contract_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, existing_service STRING, service_contracts STRING, branch_id INT, pop_id INT, address STRING, longitude DECIMAL, latitude DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_device_type (id INT, name STRING, `group` INT, capacity_data STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, color_name INT, color_code STRING, device_type STRING, icon_name STRING, width_px INT, height_px INT, priority INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_devices (id INT, tag STRING, name STRING, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, employee_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, devices_type_id INT, ip_address STRING, serial_no STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_encloser (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_end_point_device (id INT, name STRING, serial_no STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, ip_address STRING, employee_id INT, customer_id INT, upstream_device INT, device_type INT, status INT, plus_code STRING, device_id INT, is_visible INT, device_under INT, device_under_type INT, tag STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_equipment_ports_speed (id INT, device_type_id INT, device_id INT, speed_id INT, no_of_ports INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_fiber_cable (id INT, pop_id INT, cable STRING, core_id INT, status INT, branch_id INT, notes STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, to_encloser_id INT, to_cable_id STRING, cable_length DECIMAL, start_meter DECIMAL, end_meter DECIMAL, employee_id INT, cable_type INT, link_id STRING, name STRING, path STRING, tag STRING, cut_from INT, provider INT, owner_type INT, category_id INT, ref_device_type INT, ref_device_id INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_fiber_cable_core_data (id INT, pop_id INT, branch_id INT, source_cable_id INT, source_core_id INT, source_equipment_id INT, source_tube_color STRING, source_core_color STRING, to_cable_id INT, to_equipment_id INT, to_tube_color STRING, to_core_color STRING, notes STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, to_equipment_port INT, source_equipment_port INT, to_nttn_id INT, to_core_id INT, network_type INT, connection_purpose INT, source_tube_color_id INT, source_core_color_id INT, to_tube_color_id INT, to_core_color_id INT, nttn_link STRING, name STRING, junction_equipment_type INT, junction_equipment_id INT, junction_equipment_port INT, to_pop_id INT, to_equipment_type INT, status INT, is_true INT, customer_connection_id INT, source_equipment_position INT, junction_equipment_position INT, customer_id INT, connectivity_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_fiber_cable_to_core (id INT, cable_id INT, core_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_fiber_core (id INT, name INT, color_name STRING, color STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, color_id INT, thickness INT, tube_count INT, core_count INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_link_connections (id INT, link_id INT, name STRING, fiber_cable_core_data_id INT, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_links (id INT, name STRING, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_model (id INT, brand_id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, device_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_network_type (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_nttn (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_odf (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, device_under INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT, no_of_port INT, device_type INT, status INT, no_of_racks INT, plus_code STRING, device_id INT, device_under_type INT, is_visible INT, rack_unit INT, start_rack_unit_no INT, tag STRING, input_port INT, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_olt (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, device_under INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, ip_address STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT, no_of_port INT, no_of_racks INT, device_under_type INT, is_visible INT, rack_unit INT, start_rack_unit_no INT, no_of_pon_slots INT, no_of_uplink_slots INT, tag STRING, max_split_capacity INT, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_onu (id INT, name STRING, serial_no STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, ip_address STRING, employee_id INT, customer_id INT, connectivity_type_id INT, device_type INT, status INT, plus_code STRING, device_id INT, no_of_port INT, is_visible INT, device_under INT, device_under_type INT, customer_connection_id INT, tag STRING, address STRING, input_port INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_port_to_port (id INT, source_equipment_id INT, source_equipment_splitter_id INT, source_equipment_tjbox_id INT, source_network_type INT, cable_id STRING, cable_color STRING, destination_equipment_id INT, destination_equipment_splitter_id INT, destination_equipment_tjbox_id INT, destination_network_type INT, inactive INT, deleted INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, source_equipment_port INT, destination_equipment_port INT, destination_equipment_router_id INT, destination_equipment_olt_id INT, speed_id INT, destination_device_type INT, source_device_type INT, switch_port_id INT, router_port_id INT, odf_port_id INT, olt_port_id INT, customer_id INT, source_equipment_trequip_id INT, destination_equipment_trequip_id INT, uplink_port INT, customer_connection_id INT, transmission_port_id INT, connectivity_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_ports (id INT, device_type_id INT, device_id INT, port_no INT, rack_no INT, is_subport INT, speed_id INT, is_uplink INT, is_downlink INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, subport_id STRING, customer_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_rack (id INT, name STRING, pop_id INT, brand_id INT, branch_id INT, device_model_id INT, latitude DECIMAL, longitude DECIMAL, color STRING, description STRING, ins_date TIMESTAMP, inactive INT, deleted INT, icon STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT, is_visible INT, unit INT, tag STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_rack_units (id INT, device_type_id INT, device_id INT, unit_no INT, rack_id INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_router (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, device_under INT, device_type_id INT, latitude DECIMAL, longitude DECIMAL, no_of_port INT, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, ip_address STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT, customer_id INT, speed_id INT, device_under_type INT, is_visible INT, rack_unit INT, start_rack_unit_no INT, tag STRING, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_sfp (id INT, name STRING, serial_no STRING, brand_id INT, device_type INT, device_model_id INT, pop_id INT, branch_id INT, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, employee_id INT, device_id INT, speed_id INT, no_of_port INT, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_speed (id INT, name STRING, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_splitter (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, no_of_port INT, input_port INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT, is_visible INT, device_under INT, device_under_type INT, olt_id INT, olt_port_id INT, tag STRING, source_equipment_position INT, junction_equipment_position INT, address STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_switch (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, device_under INT, no_of_port INT, upstream_device INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, ip_address STRING, employee_id INT, device_type INT, status INT, bandwidth_id INT, port_no INT, customer_id INT, plus_code STRING, device_id INT, device_under_type INT, upstream_device_type INT, is_visible INT, rack_unit INT, start_rack_unit_no INT, tag STRING, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_tjbox (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, serial_no STRING, employee_id INT, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, device_type INT, status INT, plus_code STRING, device_id INT, is_visible INT, encloser_type INT, tag STRING) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_tr_channels (id INT, device_type_id INT, device_id INT, port_no INT, channel_no INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, not_config INT, port_text STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS im_tr_equipment (id INT, name STRING, brand_id INT, device_model_id INT, pop_id INT, branch_id INT, latitude DECIMAL, longitude DECIMAL, inactive INT, deleted INT, icon STRING, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_no STRING, employee_id INT, device_type INT, status INT, plus_code STRING, device_id INT, mux_demux_type INT, ref_mux_id INT, channel_no INT, port_id INT, channel_id INT, port_no INT, is_visible INT, rack_unit INT, start_rack_unit_no INT, device_under INT, device_under_type INT, tag STRING, wdm_type INT, is_decim_device INT) PARTITIONED BY (installation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS import_lc_couriers (id INT, lc_id INT, name STRING) PARTITIONED BY (maturity_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS import_lc_documents (id INT, lc_id INT) PARTITIONED BY (received_date DATE, lading_date DATE, invoice_date DATE, eta_date DATE, etd_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS import_lcs (id INT, lc_number STRING, percentage DECIMAL, master_lc_id INT, cnf_agent_id INT, forwarder STRING, pi_num STRING, imp_form_num STRING, lca_form_num STRING, bank_id INT, group_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS indent_outlines (id INT, name STRING, code STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, term_1 STRING, term_2 STRING, term_3 STRING, term_4 STRING, term_5 STRING, term_6 STRING, term_7 STRING, term_8 STRING, term_9 STRING, term_10 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS info_cards (id INT, header STRING, url STRING, module STRING, internal_name STRING, `order` INT, inactive TINYINT, bg_header STRING, bg_detail STRING, data_url STRING, config STRING, is_updated INT, redirect_url STRING, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS insurance_companies (id INT, status INT, back_ref INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS internal_product_serials (id INT, product_id INT, po_id INT, so_id INT, pd_id INT, sd_id INT, status INT, serial STRING, created_by INT, created TIMESTAMP, deleted TINYINT, inactive TINYINT, depreciation_rate DECIMAL, assigned TINYINT, delivery_product_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS interview_board_members (id INT, interview_board_id INT, employee_id INT, weightage DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS interview_boards (id INT, title STRING, marking_system INT, independent_system INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventories (id INT, name STRING, address_id INT, type INT, inventory_type INT, account_id INT, updated TIMESTAMP, updated_by INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT, description STRING, branch_id INT, index INT, wastage_kpi INT, outline_id INT, project_id INT, parent_id INT, depth INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventories_recalculation (id INT, inventory_id INT, `date` TIMESTAMP, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_audit (id INT, branch_id INT, `start` TIMESTAMP, `end` TIMESTAMP, name STRING, department_name STRING, sku STRING, product_id INT, erp_serial STRING, physical_serial STRING, entry_type STRING, matching_status STRING, stock_difference INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_journal_update_table (id INT, product_id INT, inventory_journal_id INT, delivery_id INT, quantity DECIMAL, qty_kgs DECIMAL, cost DECIMAL, dirty TINYINT, barcode STRING, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_journals (id INT, order_id INT, delivery_id INT, delivery_product_id INT, order_product_id INT, delivered_quantity DECIMAL, product_id INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, inventory_id INT, inventory_journal_type INT, parent_id INT, project_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, cost DECIMAL, voucher_type INT, sale_price DECIMAL, dirty TINYINT, style_id INT, if_product TINYINT, carton_quantity DECIMAL, carton_capacity DECIMAL, chassis STRING, length DECIMAL, standard_wt_per_kg_feet DECIMAL, standard_wt_per_pcs_kgs DECIMAL, actual_wt_kg_feet DECIMAL, over_less_wt DECIMAL, net_production_wt DECIMAL, wastage DECIMAL, dia_no DECIMAL, qty_pcs DECIMAL, qty_uom DECIMAL, qty_kgs DECIMAL, product_code STRING, barcode STRING, custom_field_1 STRING, beam_no STRING, roll_number STRING, quality_code STRING, extra_quality_code STRING, qty_points INT, gross_weight DECIMAL, calculated_actual_weight DECIMAL, width_uom DECIMAL, no_of_pieces DECIMAL, grade STRING, plate_no STRING, set_no STRING, display_gross_weight DECIMAL, display_calculated_actual_weight DECIMAL, unit_weight DECIMAL) PARTITIONED BY (entry_date DATE, manufacturing_date DATE, expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_movement_caches (id INT, product_id INT, tenure INT, total_quantity_in DECIMAL, total_tp DECIMAL, branch_id INT, entry_date TIMESTAMP, from_date TIMESTAMP, to_date TIMESTAMP, total_sale_price DECIMAL, total_quantity_out DECIMAL, last_quantity_out DECIMAL, last_total_sale_price DECIMAL, dirty TINYINT, last_total_tp DECIMAL, last_quantity_in DECIMAL, product_barcode STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_outlines (id INT, name STRING, code STRING, product_feature STRING, prefix STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, inactive TINYINT, deleted TINYINT, created_by TINYINT, updated TIMESTAMP, updated_by INT, created TIMESTAMP, show_note TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_products (id INT, inventory_id INT, product_id INT, status INT, unit_cost DECIMAL, total_cost DECIMAL, order_id INT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, quantity_on_hand DECIMAL, quantity_commited DECIMAL, quantity_received DECIMAL, quantity_transport_in DECIMAL, quantity_transport_out DECIMAL, quantity_issued DECIMAL, quantity_scrapped DECIMAL, quantity_sold DECIMAL, quantity_transferred DECIMAL, transport_status INT, standard_cost DECIMAL, name STRING, description STRING, serial STRING, project_id INT, depreciate_amount DECIMAL, asset_status INT, unit_depreciate_amount DECIMAL, current_depreciate_amount DECIMAL, quantity_consumed DECIMAL, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, production_id INT) PARTITIONED BY (start_date DATE, expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_recalculation_physically_found_products (id INT, inventory_recalculation_id INT, quantity DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_recalculation_products (id INT, inventory_id INT, recalculation_id INT, item_id INT, product_id INT, quantity DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_reconciliation_products (id INT, inventory_reconciliation_id INT, inventory_id INT, product_id INT, total_in DECIMAL, total_out DECIMAL, total_consumed DECIMAL, calculated_stock DECIMAL, stock_difference DECIMAL, calculated_cost_difference DECIMAL, actual_cost_difference DECIMAL, code STRING, barcode STRING, avg_tp DECIMAL, actual_stock DECIMAL, opening_stock DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_reconciliations (id INT, inventory_id INT, status INT, start_date TIMESTAMP, end_date TIMESTAMP, code STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by STRING, created TIMESTAMP, updated_by STRING, name STRING, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS inventory_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS investment_profile_renewals (id INT, investment_id INT, tenure INT, amount DECIMAL, roi_rate DECIMAL, charge_frequency_id INT, tax_rate DECIMAL, remarks STRING, base STRING, status INT) PARTITIONED BY (entry_date DATE, issue_date DATE, maturity_date DATE, repayment_start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS investment_profile_types (id INT, name STRING, investment_acc_id INT, income_acc_id INT, receivable_acc_id INT, interest_acc_id INT, charge_acc_id INT, ait_acc_id INT, excise_acc_id INT, status INT, payable_acc_id INT, expense_acc_id INT, employee_associated INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS investment_profiles (id INT, name STRING, number STRING, acc_number STRING, type_id INT, branch_id INT, project_id INT, total_year_days INT, bank_id INT, bank_branch_id INT, interest_rate_history STRING, amount DECIMAL, tenure INT, roi_rate DECIMAL, charge_frequency_id INT, tax_rate DECIMAL, remarks STRING, investment_acc_id INT, income_acc_id INT, receivable_acc_id INT, interest_acc_id INT, charge_acc_id INT, ait_acc_id INT, excise_acc_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, payable_acc_id INT, expense_acc_id INT, employee_associated INT, party_id INT, salary_deduction INT) PARTITIONED BY (entry_date DATE, issue_date DATE, maturity_date DATE, repayment_start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS investment_vouchers_additional_info (id INT, investment_id INT, voucher_id INT, voucher_type INT, interest_receivable_amount DECIMAL, excise_duty_percentage INT, bank_charge_percentage INT, ait_percentage INT, excise_duty_amount DECIMAL, bank_charge_amount DECIMAL, ait_amount DECIMAL, voucher_amount DECIMAL, party_id INT, inactive INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ip_address (id INT, address STRING, code STRING, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS item_dias (id INT, item_id INT, dia_id INT, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS item_features (id INT, item_id INT, feature_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS items (id INT, name STRING, description STRING, unit_of_measurement_id INT, manufacturer_id INT, step_size DECIMAL, mrp DECIMAL, vat DECIMAL, vendor_id INT, ordered_qty DECIMAL, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, type INT, barcode STRING, inactive TINYINT, deleted TINYINT, asset_category_id INT, location_id INT, income_acc_id INT, parent_id INT, depth INT, code STRING, movement_tenure INT, cost_tenure INT, expense_acc_id INT, no_promotion TINYINT, no_sales_point TINYINT, is_asset TINYINT, residual_value DECIMAL, asset_master_id INT, asset_depreciation_rate DECIMAL, branch_id INT, is_dummy TINYINT, non_inventory TINYINT, ordered_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_allocation_details (id INT, allocation_id INT, designation_level_id INT, job_allocation INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_allocations (id INT, branch_id INT, department_id INT, designation_id INT, job_allocation INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_benefits (id INT, jobs_id INT, benefits STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_educational_qualification (id BIGINT, jobs_id INT, education_level INT, degree_title STRING, major_group STRING, result INT, CGPA DOUBLE, Scale INT, marks DOUBLE) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_locations (id INT, code STRING, name STRING, address_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_request_status_histories (id INT, job_request_id INT, status INT, assignee INT, assigned_to INT, level_id INT, line_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, remarks STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_requisition_details (id INT, type INT, requisition_id INT, designation_id INT, priority INT, quantity DECIMAL, request_quantity DECIMAL, recommend_quantity DECIMAL, approved_quantity DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, ctc_unit DECIMAL, man_budget_detail_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_requisitions (id INT, requisition_number STRING, request_id INT, position_id INT, prepared_by INT, proposed_recommender INT, proposed_approver INT, department_id INT, priority INT, branch_id INT, description STRING, status INT, recommended_by INT, approved_by INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, designation_level_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, requisition_type INT, man_budget_id INT) PARTITIONED BY (`date` DATE, recommended_date DATE, approved_date DATE, deadline_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_responsibilities (id INT, jobs_id INT, responsibility STRING, responsibility_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_terms_conditions (id INT, jobs_id INT, terms STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_vacancies (id INT, status INT, branch_id INT, department_id INT, designation_id INT, type INT, replacement_of INT, no_of_positions INT, responsibilities STRING, skills STRING, qualifications STRING, experiences STRING, years_of_experience INT, candidate_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT) PARTITIONED BY (opening_date DATE, closing_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_work_products (id INT, item_id INT, product_id INT, job_work_id INT, unit_of_measurement_id INT, unit_cost DECIMAL, hs_code STRING, description STRING, tax_1 DECIMAL, tax_2 DECIMAL, tax_3 DECIMAL, quantity DECIMAL, total DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS job_works (id INT, invoice_no STRING, party_id INT, billing_address STRING, shipping_address STRING, billing_gstin STRING, shipping_gstin STRING, status INT, type INT, grand_total DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, voucher_ids STRING) PARTITIONED BY (date_of_issue DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS jobs (id INT, job_title STRING, job_description STRING, department_id INT, designation_id INT, experience INT, age_limit_start INT, age_limit_End INT, salary_type INT, salary_start_range DOUBLE, salary_end_range DOUBLE, vacancy_assessment_outline_id INT, branch_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS journals (id INT, voucher_id INT, amount DECIMAL, party_id INT, project_id INT, party_role_id INT, type INT, description STRING, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT, inactive TINYINT, deleted TINYINT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS junk_leads (id INT, crm_leads_id INT, reason STRING, status INT) PARTITIONED BY (next_contact_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS kpi_based_salary (id INT, name STRING, code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS kpi_based_salary_slab (id INT, kpi_based_salary_id INT, amount DECIMAL, percentage DECIMAL, kpi_from DECIMAL, kpi_to DECIMAL, code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS late_adjustments (id INT, code STRING, employee_leave_id INT, employee_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, transaction_id INT, own_approval INT, remarks STRING, remarks_id INT) PARTITIONED BY (adjustment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS late_deduction_attendance (id INT, leave_type_id INT, taken_days DECIMAL, deduction_amount DECIMAL, holiday_policy_id INT, comment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS late_deduction_policies (id INT, name STRING, leave_policy_id INT, consecutive_late_days INT, consecutive_late_deduction_1_leave_type_id INT, consecutive_late_deduction_2_leave_type_id INT, consecutive_late_deduction_3_leave_type_id INT, consecutive_late_deduction_4_leave_type_id INT, consecutive_late_LWOP_leave_type_id INT, non_consecutive_late_days INT, non_consecutive_late_deduction_1_leave_type_id INT, non_consecutive_late_deduction_2_leave_type_id INT, non_consecutive_late_deduction_3_leave_type_id INT, non_consecutive_late_deduction_4_leave_type_id INT, non_consecutive_late_LWOP_leave_type_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS late_fee_policies (id INT, name STRING, rate DECIMAL, amount DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS layer (id INT, layer_name STRING, hierarchy INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_groups (id INT, name STRING, description STRING, currency STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_import_invoice_outline (id INT, name STRING, code STRING, lc_expenses INT, allocated_expenses INT, maturitydate INT, debit INT, credit INT, debit_name STRING, credit_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_outlines (id INT, name STRING, code STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, inventory TINYINT, sc_no INT, export_lc_no INT, export_lc_value INT, export_days INT, supplier INT, buyer STRING, indent_agent INT, pi_date INT, import_lc_percent INT, description INT, currency STRING, swift_code INT, bblc_no INT, bblc_date INT, lc_value INT, lca_no INT, irc_no INT, erc_no INT, fabric_length INT, gmts_qnty INT, bb_ref INT, applicant_bin_no INT, applicant_tin_no INT, issue_bank_bin_no INT, issue_bank_tin_no INT, beneficiary_bin_no INT, beneficiary_tin_no INT, delivery_term INT, fabric_origin INT, insurance_company_id INT, insurance_company_address INT, insurance_cover_note INT, insurance_date INT, sappo_no INT, bw_license INT, bw_license_date INT, ammendment_no INT, ammendment_date INT, ammendment_remarks INT, port_of_loading INT, shipping_marks INT, marketing_person_name INT, finished_weight INT, color INT, weave INT, width INT, construction INT, quality_code INT, quality INT, pi_qnty INT, pi_value INT, uom INT, style_no INT, item INT, product INT, unit INT, indentor INT, lc_tolerance INT, b2b_limit INT, total_container INT, project INT, sales_con_no INT, sales_con_date INT, delivery_term_text STRING, trade_term_text STRING, port_of_loading_text STRING, port_of_destination_text STRING, fabric_origin_text STRING, gmts_qty_and_items_text STRING, file_info INT, exp_sales_c_date_format INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_product_type (id INT, name STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_purchase_invoice_expenses (id INT, lc_id INT, order_id INT, order_number STRING, invoice_id INT, branch_id INT, voucher_id INT, journal_voucher_id INT, expense_purpose_id INT, delivery_id INT, description STRING, expense_percent DECIMAL, calculation_method_id INT, exchange_rate DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, type INT, rebate_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_purchase_orders (lc_id INT, purchase_order_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_reminder (id INT, commercial_doc_id INT, subject STRING, priority INT, reminder_type STRING, note STRING) PARTITIONED BY (creation_date DATE, reminder_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS lc_wise_expense_purposes (id INT, lc_id INT, expense_purpose_id INT, inactive INT, `order` INT, impact_on_landed_cost INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lcs (id INT, lc_type INT, sale_contact STRING, indent_agent_id INT, tolerance DECIMAL, margin DECIMAL, partial_shipment TINYINT, lc_tenor_days STRING, transhipment STRING, cnf_forwarder_id INT, btb_limit DECIMAL, lc_product_type_id INT, buyer_exp_lc_no STRING, total_container INT) PARTITIONED BY (expiry_date DATE, shipment_expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS lead_sources (id INT, name STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS leads (id INT, status INT, category INT, assign_to INT, relation INT) PARTITIONED BY (from_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS leads_type_table (id INT, leads_id INT, opportunity_type_id INT, type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_balance (id INT, leave_type_id INT, employee_id INT, balance DECIMAL, rate DECIMAL, inactive TINYINT, deleted TINYINT, status INT, reason INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, usage_type TINYINT, used DECIMAL, payroll_schedule_id INT, compensatory_leave_id INT, notes STRING) PARTITIONED BY (entry_date DATE, validity DATE, late_deduction_date DATE, expiry_date DATE, exipry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_cancellation_applications (id INT, leave_id INT, employee_id INT, status INT, reason STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (apply_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_data (id INT, leave_type_id INT, leave_policy_id INT, calculation_method TINYINT, counting_method TINYINT, leave_restriction_at_a_time INT, application_restriction_in_a_month INT, sick_leave_limit_without_medical_certificate INT, is_full_day INT, is_half_day INT, is_quarter_day INT, is_hourly INT, is_paid INT, deduction_calculation_base INT, working_days_calculation_base INT, is_emergency INT, emergency_application_within INT, is_accumulative INT, cf_1_yearly_limit DECIMAL, cf_1_max_balance DECIMAL, applicable_after INT, is_male INT, is_female INT, increment_value INT, max_days_per_year INT, is_encashable INT, encahment_limit_in_year INT, cf_2_yearly_limit DECIMAL, encashment_calculation_method INT, encashment_calculation_divisor DECIMAL, is_encashment_taxable INT, is_maternity INT, lived_children_limit INT, ml_instance_limit_in_service_with_company INT, ml_instance_with_pay_limit_in_service_with_company INT, ml_limit_before_birth INT, ml_limit_after_birth INT, is_include_delivery_date INT, ml_bill_calculation_method INT, is_require_birth_confirmation INT, is_require_medical_certificate INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, cf_1_type TINYINT, cf_1_percent DECIMAL, cf_1_validity_days INT, cf_2_type TINYINT, cf_2_percent DECIMAL, cf_2_validity_days INT, ml_calculate_bill_on INT, count_after INT, count_late INT, encashment_limit_for_cf DECIMAL, incremental_holiday INT, incremental_weekend INT, applicable_to INT, is_compensatory INT, expiry_days INT, lwop_deduction_percentage DECIMAL, hour_limit DECIMAL, max_hours_per_year DECIMAL, max_leave_service_life INT, max_leave_fiscal_year INT, apply_for_self_leave INT, include_holiday_suffix INT, include_holiday_prefix INT, count_minimum_adjacent_holiday INT, min_hour_limit DECIMAL, leave_restriction_in_a_month DECIMAL, is_limitless INT, min_present_days INT, calendar_system TINYINT, is_study_leave INT, is_overseas INT, is_mandatory INT, is_with_station INT, overseas_application_within INT, mandatory_application_within INT, with_station_application_within INT, enable_consecutive_leave_restriction INT, consecutive_restriction_period INT, enable_resigned_restriction INT, days_eligible_after_resignation INT, is_hajj_leave INT, hajj_leave_quota INT, eligibility_before_retirement INT, negative_balance_allow INT, advance_leave_days INT, restricted_leave_type_list STRING, global_leave_approver INT, approver_mail STRING, incremental_unit DECIMAL, min_leave_restriction_at_a_time DECIMAL, is_comment_mandatory INT, is_address_mandatory INT, leave_bridging INT, included_leave_type_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_encashments (id INT, employee_id INT, leave_type_id INT, days DECIMAL, amount DECIMAL, status INT, payroll_earning_id INT, payroll_payment_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_expiry (id INT, employee_id INT, leave_type_id INT, expiry_days INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_notice (id INT, leave_policy_id INT, leave_type_id INT, duration_from DECIMAL, duration_to DECIMAL, apply_before DECIMAL, apply_unit INT, applicable_for INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_policies (id INT, name STRING, code STRING, total_days INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, comment STRING, updated_by INT, calendar_system TINYINT, leave_year_start_month INT, leave_year_start_day INT, branch_id INT, branch_id_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_records (id INT, schedule_id INT, schedule_attendance_id INT, leave_type_id INT, taken_days DECIMAL, deduction_amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS leave_types (id INT, status INT, name STRING, calculation_method TINYINT, counting_method TINYINT, leave_restriction_at_a_time INT, application_restriction_in_a_month INT, sick_leave_limit_without_medical_certificate INT, is_full_day INT, is_half_day INT, is_quarter_day INT, is_hourly INT, code STRING, is_paid INT, deduction_calculation_base INT, working_days_calculation_base INT, is_emergency INT, emergency_application_within INT, is_accumulative INT, cf_1_yearly_limit DECIMAL, cf_1_max_balance DECIMAL, applicable_after INT, is_male INT, is_female INT, increment_value INT, max_days_per_year INT, is_encashable INT, encahment_limit_in_year INT, cf_2_yearly_limit DECIMAL, encashment_calculation_method INT, encashment_calculation_divisor DECIMAL, is_encashment_taxable INT, is_maternity INT, lived_children_limit INT, ml_instance_limit_in_service_with_company INT, ml_instance_with_pay_limit_in_service_with_company INT, ml_limit_before_birth INT, ml_limit_after_birth INT, is_include_delivery_date INT, ml_bill_calculation_method INT, is_require_birth_confirmation INT, is_require_medical_certificate INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, cf_1_type TINYINT, cf_1_percent DECIMAL, cf_1_validity_days INT, cf_2_type TINYINT, cf_2_percent DECIMAL, cf_2_validity_days INT, ml_calculate_bill_on INT, count_after INT, count_late INT, applicable_to INT, is_compensatory INT, expiry_days INT, lwop_deduction_percentage DECIMAL, hour_limit DECIMAL, max_hours_per_year DECIMAL, max_leave_service_life INT, max_leave_fiscal_year INT, apply_for_self_leave INT, include_holiday_suffix INT, include_holiday_prefix INT, count_minimum_adjacent_holiday INT, min_hour_limit DECIMAL, leave_restriction_in_a_month DECIMAL, is_limitless INT, min_present_days INT, calendar_system TINYINT, is_overseas INT, is_mandatory INT, is_with_station INT, overseas_application_within INT, mandatory_application_within INT, with_station_application_within INT, enable_consecutive_leave_restriction INT, consecutive_restriction_period INT, enable_resigned_restriction INT, days_eligible_after_resignation INT, incremental_unit DECIMAL, min_leave_restriction_at_a_time DECIMAL, leave_bridging INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ledger_tags (id INT, table_name STRING, table_key INT, ledger_id INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS ledgers (id INT, journal_id INT, voucher_id INT, account_id INT, amount DECIMAL, party_type STRING, party_id INT, party_role_id INT, custom_field_1 STRING, ref_invoice INT, description STRING, project_id INT, branch_id INT, src_currency STRING, src_amount DECIMAL, party_currency STRING, party_amount DECIMAL, account_currency STRING, account_amount DECIMAL, inactive TINYINT, other_accounts STRING, deleted TINYINT, year_closing TINYINT, cost_center_id INT, hide_on_edit TINYINT, is_adjustment INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS letters (id INT, name STRING, file_id INT, classification INT, level INT, reason STRING, current_place STRING, description STRING, type INT, status INT, received_by STRING, sender_id INT, sender_name STRING, file_link STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, receiver_id INT, organization INT, received_by_name STRING, received_by_date TIMESTAMP) PARTITIONED BY (received_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS letters_movement_info (id INT, file_from_id INT, file_to_id INT, file_to_name STRING, letter_name STRING, forwarded_by STRING, forwarded_to STRING, department_from STRING, department_to STRING, description STRING) PARTITIONED BY (movement_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS levelwise_sales_quota_ratios (id INT, sales_quota_distribution_level_id INT, ref_sales_quota_distribution_level_id INT, distribution_point_id INT, distribution_point_value_id INT, ref_distribution_point_id INT, ref_distribution_point_value_id INT, cost_center_id INT, employee_id INT, project_id INT, department_id INT, branch_id INT, product_id INT, item_id INT, based_on INT, frequency INT, level INT, is_total INT, year STRING, half INT, terminal INT, quarter INT, month INT, week INT, ratio DECIMAL, revision INT, final_revision INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, ref_distribution_point_level_2_id INT, ref_distribution_point_level_2_value_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS limited_employee_payroll (id INT, employee_id INT, payroll_item_id INT, amount DECIMAL, calculation_type INT, rounding_after INT, multiplier INT, divisor INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS line_wise_card_punch_record (id INT, line_no STRING, card_no STRING, punch_time STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_authors (id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_book_accessions (id INT, book_id INT, accession_no STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, book_condition INT, commercial_doc_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_book_authors (id INT, book_id INT, author_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_books (id INT, name STRING, genre STRING, isbn STRING, edition STRING, actual_copy INT, current_copy INT, status INT, purchase_price STRING, sale_price DECIMAL, availability_in_lending INT, synopsis STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, image_url STRING, item_id INT, call_number STRING, publisher STRING, publication_place STRING, total_page INT, source_type INT, book_condition STRING, sub_tittle STRING) PARTITIONED BY (published_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_genres (id INT, name STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_items (id INT, name STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_member_book_borrow_requests (id INT, request_number STRING, member_id INT, book_id INT, status INT, approved_by INT, rack_id INT, shelf_no INT, quantity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE, probable_return_date DATE, approved_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_members (id INT, first_name STRING, last_name STRING, code STRING, contact_no STRING, email STRING, address STRING, nid STRING, emp_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, designation STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS lms_memberships (id INT, member_id INT, reg_date TIMESTAMP, expiry_date TIMESTAMP, cancellation_date TIMESTAMP, card_no STRING, status INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_amendments (id INT, loan_id INT, loan_amount DECIMAL, installment_amount DECIMAL, interest_rate DECIMAL, installments INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, type INT, repayment_delay INT, repayment_delay_days INT, charge DECIMAL) PARTITIONED BY (next_repayment_date DATE, application_date DATE, approval_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_policies (id INT, loan_on INT, multiplier_type INT, loan_type_id INT, multiplier INT, eligible_after_type INT, eligible_after INT, application_limit INT, application_limit_frequency INT, repayment_frequency INT, min_installment INT, max_installment INT, interest_applicable INT, interest_exemption_period INT, interest_repayment_delay INT, interest_calculation_method INT, repayment_calculation_method INT, allow_concurrent_laon INT, interest_review_frequency INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, installment_applicable INT, interest_rate DECIMAL, name STRING, loan_account STRING, principal_account STRING, interest_account STRING, contra_account STRING, employment_type STRING, loan_on_amount DECIMAL, repayment_delay INT, fixed_varient INT, max_tenure INT, max_delay INT, repayment_from_disburse_month INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_relations (id INT, loan_id INT, external_object_id INT, external_parent_object_table STRING, external_object_table STRING, external_parent_object_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_repayments (id INT, employee_id INT, loan_id INT, loan_schedule_id INT, employee_schedule_id INT, loan_type INT, payroll_schedule_id INT, status INT, amount DECIMAL, principal DECIMAL, interest DECIMAL, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_schedules (id INT, employee_id INT, loan_id INT, loan_type INT, amount DECIMAL, principal DECIMAL, paid TINYINT, interest DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, amendment_id INT, delay_months INT, delay_days INT, calculated_interest DECIMAL) PARTITIONED BY (schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS loan_types (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, prefix STRING, is_pf INT, `order` STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS loans (id INT, employee_id INT, status INT, type INT, interest_rate DECIMAL, loan_amount DECIMAL, interest_amount DECIMAL, total_amount DECIMAL, duration DECIMAL, repayment_mode_id INT, paid_amount DECIMAL, installment_amount DECIMAL, total_installments INT, paid_installments INT, verified_by INT, verified_amount DECIMAL, verified_installment INT, verified_installment_amount DECIMAL, priority INT, approved_by INT, approved_amount DECIMAL, approved_installment INT, approved_installment_amount DECIMAL, payroll_payment_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, description STRING, inactive TINYINT, deleted TINYINT, loan_policy_id INT, repayment_delay_months INT, repayment_delay_days INT, workflow_status INT, own_approval INT, transaction_id INT) PARTITIONED BY (entry_date DATE, `start` DATE, `end` DATE, possible_disburse_date DATE, repayment_start_date DATE, verification_date DATE, approved_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS location_tracking_records (id INT, name STRING, address STRING, latitude STRING, longitude STRING, tracking_time TIMESTAMP, table_name STRING, table_key INT, model_name STRING, user_id INT, employee_id INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, attachment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS locations (id INT, type INT, name STRING, parent_id INT, code STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted TINYINT, updated_by INT, inactive TINYINT, dialing_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS machine_state_histories (id INT, job_request_id INT, registered_machine_id INT, unit_id INT, department_id INT, floor_id INT, line_id INT, status INT, start_time TIMESTAMP, end_time TIMESTAMP, duration DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, updated_by TIMESTAMP, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS machineries (id INT, prod_equipment_grp_id INT, parent_equipment_id INT, name STRING, code STRING, description STRING, prod_unit_id INT, type INT, maximum_runtime DECIMAL, maintenance_duration INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, product_id INT, maintenance_frequency INT, life_span INT, subtype INT, required_operators INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_frequencies (id INT, name STRING, frequency INT, machinery_id INT, maintenance_duration INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_histories (id INT, registered_machine_id INT, machine_id INT, registered_accessory_id INT, accessory_id INT, maintenance_schedule_id INT, scheduled_duration INT, type INT, responsible_person INT, assigned_to INT, product_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, updated_by TIMESTAMP) PARTITIONED BY (scheduled_date DATE, actual_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_job_request_assignee (id INT, machinery_maintenance_job_request_id INT, assigned_to INT, assignee INT, start_time TIMESTAMP, end_time TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_job_request_conversations (id INT, machinery_maintenance_job_request_id INT, message STRING, message_by INT, message_time TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_job_requests (id INT, code STRING, registered_machine_id INT, registered_accessory_id INT, machine_id INT, accessory_id INT, scheduled_duration DECIMAL, type INT, machine_type INT, assigned_to INT, product_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, status INT, updated_by TIMESTAMP, level_id INT, stage_id INT, verdict_id INT, maintenance_reason STRING, priority INT, schedule_id INT, branch_id INT, department_id INT, level_id_list STRING) PARTITIONED BY (scheduled_date DATE, issue_gen_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_schedule_assignee (id INT, machinery_maintenance_schedule_id INT, assigned_to INT, assignee INT, start_time TIMESTAMP, end_time TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_schedule_conversations (id INT, machinery_maintenance_schedule_id INT, message STRING, message_by INT, message_time TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_schedule_levels (id INT, name STRING, group_email STRING, level_type INT, description STRING, branch_id INT, department_id INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS machinery_maintenance_schedules (id INT, registered_machine_id INT, registered_accessory_id INT, machine_id INT, accessory_id INT, scheduled_duration DECIMAL, type INT, machine_type INT, assigned_to INT, product_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, updated_by TIMESTAMP, code STRING, job_request_id INT, level_id INT, stage_id INT, verdict_id INT, branch_id INT, notification_status INT) PARTITIONED BY (scheduled_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS machines (id INT, name STRING, machine_number STRING, start_time STRING, end_time STRING, type STRING, block STRING, machine_gg STRING, line_number STRING, finished_product_size STRING, status INT, factory_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS maintenance_level_agents (id INT, level_id INT, employee_id INT, email STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS maintenance_levels (id INT, name STRING, group_email STRING, level_type INT, description STRING, branch_id INT, department_id INT, inactive INT, rank INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS maintenance_reasons (id INT, name STRING, code STRING, machine_id INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS maintenance_status_histories (id INT, job_request_id INT, assigned_to INT, assignee INT, stage_id INT, super_stage_id INT, verdict_id INT, verdict_date TIMESTAMP, verdict_status INT, latest INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS manpower_budget_amendments (id INT, man_budget_id INT, prev_quantity INT, new_quantity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, own_approval INT, transaction_id INT, man_detail_id INT, name STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS manpower_budget_details (id INT, man_budget_id INT, branch_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, designation_type_id INT, designation_id INT, quantity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS manpower_budget_requisitions (id INT, man_budget_id INT, quantity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, man_budget_details_id INT, status INT, own_approval INT, transaction_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS manpower_budgets (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, own_approval INT, transaction_id INT) PARTITIONED BY (start_year DATE, end_year DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS manufacturer_drafts (id INT, manufacturer_id INT, status INT, full_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS manufacturers (id INT, status INT, is_posted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS market_return_purposes (id INT, name STRING, label STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS master_budgets (id INT, budget_name STRING, branch_id INT, supervisor_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, status INT, approved_by INT, approved_date TIMESTAMP, budget_scenario_id INT, description STRING, parent_id INT, source_type STRING, source_id INT, distribution_method_id INT, receive_work_order_id INT, template_id INT, budget_type INT, budget_amount DECIMAL, child_budget_type INT, version_no STRING, frequency_type_id INT, start_year INT, end_year INT, year INT, frequency_value INT, child_frequency_type_id INT, version_type INT, is_primary_budget INT, is_company_budget INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS master_budgets_child_distribution_rule (id INT, budget_id INT, weight DECIMAL, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS material_issue_type (id INT, name STRING, code STRING, account_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS meeting_agendas (id INT, meeting_id INT, title STRING, responsible_person STRING, start_time STRING, end_time STRING, duration INT, title_group STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS meeting_attendees (id INT, meeting_id INT, attendee_name STRING, attendee_designation STRING, attendee_department STRING, attendee_email STRING, attendee_phone STRING, attendee_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS meeting_objectives (id INT, meeting_id INT, title STRING, type INT, created_by INT, created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS meetings (id INT, source_type INT, source_id INT, party_id INT, type INT, title STRING, notes STRING, initiated_by INT, created TIMESTAMP, updated TIMESTAMP, updated_by INT, created_by INT, inactive INT, deleted INT, template_id INT, meeting_url STRING, code STRING, start_time STRING, end_time STRING) PARTITIONED BY (meeting_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS member_sales_target (id INT, sales_target_location_id INT, employee_id INT, amount DECIMAL, name STRING, frequency INT, year INT, month_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS member_sales_target_members (id INT, member_sales_target_id INT, employee_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS membership_cards (id INT, name STRING, index INT, party_type STRING, amount DECIMAL, point DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, adjust_percent DECIMAL, gift_percent DECIMAL, cash_back_percent DECIMAL, prefix STRING, min_redeem_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS miscellaneous (id INT, key STRING, json_data STRING, readable_name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mms_booking_mapper (id INT, mms_booking_id INT, buyer_order_id INT, style_order_id INT, quantity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS mms_bookings (id INT, payment_method_type INT, booking_type INT, loading_port_id INT, destination_port_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (etd DATE, eta DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS mms_shipments (id INT, shipment_number STRING, origin_port INT, destination_port INT, shipping_method_id INT, shipment_term_id INT, status INT, buyer_order_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_manufacturing_doc_item_attachments (id INT, doc_item_id INT, attachment_name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_manufacturing_doc_item_variants (id INT, size INT, color INT, quantity INT, unit_price DECIMAL, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_manufacturing_doc_items (id INT, doc_id INT, item_id INT, style_id INT, style_type_id INT, smv DECIMAL, fabrication STRING, buyer_target_price DECIMAL, estimated_price DECIMAL, quantity INT, has_sample INT, payment_mode INT, comments STRING, designer STRING, technical_designers STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, style_description STRING) PARTITIONED BY (etd DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_manufacturing_docs (id INT, code STRING, type INT, branch_id INT, buyer_id INT, buyer_inquiry_no INT, agent_id INT, season_id INT, description STRING, merchandiser_id INT, manager_id INT, currency STRING, status INT, contact_person_info STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, team_id INT) PARTITIONED BY (receive_date DATE, quot_send_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_order_files (id INT, name STRING, code STRING, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_pack_types (id INT, name STRING, code STRING, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mnf_seasons (id INT, name STRING, code STRING, year STRING, print_as STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_action_templates (id INT, name STRING, code STRING, template STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_actions (id INT, name STRING, code STRING, auto_accept TINYINT, template_id INT, type INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_configurations (id INT, provider_id INT, service_id INT, action_id INT, merchant_no STRING, branch_id INT, account_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_outlines (id INT, name STRING, page_title STRING, service_id INT, action_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_provider_facilities (id INT, provider_id INT, service_id INT, trx_type STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_providers (id INT, name STRING, code STRING, business_entity STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_services (id INT, name STRING, code STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_transaction_actions_log (id INT, transaction_id INT, action_id INT, voucher_id INT, message STRING, action_status STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_transactions (id INT, provider_id INT, service_id INT, party_id INT, sender_no STRING, merchant_no STRING, action_status TINYINT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mobile_banking_transactions_log (id INT, provider_id INT, trx_id STRING, amount DECIMAL, counter STRING, currency STRING, date_time STRING, receiver STRING, reference STRING, sender STRING, service STRING, trx_status STRING, action_status TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS mode_of_travels (id INT, name STRING, inactive STRING, deleted STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS model_wise_data_mappings (id INT, model STRING, mapping STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS model_wise_event_mappings (id INT, event STRING, model STRING, filter STRING, data_mapping_id INT, `transform` STRING, template_id INT, server_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, is_background INT, response_mapping STRING, api_info_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS models (id INT, name STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, manufacturer_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS module_wise_backdate_info (id INT, module_id INT, number_of_days INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS modules (id INT, module_name STRING, display_name STRING, app_id INT, module_order INT, background_color STRING, foreground_color STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS money_exchange_categories (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS movement_register_outline (id INT, name STRING, not_return INT, time_duration INT, reason INT, remark INT, check_in INT, check_out INT, designation_id INT, department_id INT, branch_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, charging_code INT, conveyance_bill_amount INT, comment INT, start_time INT, end_time INT, auto_approve INT, place INT, from_date INT, to_date INT, mode_of_travel INT, purpose_of_visit INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS movement_registers (id INT, employee_id INT, total_days INT, approved_days INT, approved_by INT, recommended_by INT, rejected_by INT, cancelled_by INT, status INT, place STRING, purpose_of_visit INT, created_by INT, updated_by INT, inactive INT, version INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, comment STRING, charging_code STRING, mode_of_travel STRING, conveyance_bill_amount DECIMAL, voucher_id INT, start_time STRING, end_time STRING, transaction_id INT, own_approval INT, not_return INT, card_id STRING, employee_code STRING, time_duration STRING, reason INT, remark STRING, check_in STRING, check_out STRING, type INT) PARTITIONED BY (entry_date DATE, from_date DATE, to_date DATE, approved_to DATE, approved_from DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS mrp_purchase_orders (id INT, wo_id INT, po_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS multi_cheque_details (id INT, multi_cheque_id INT, account_id INT, party_id INT, bank_id INT, cheque_amount DECIMAL, description STRING, cheque_number STRING, voucher_id INT, account_number STRING, cheque_book_id INT, cheque_book_leaf_id INT, project_id INT) PARTITIONED BY (cheque_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS multi_cheque_vouchers (id INT, multi_cheque_id INT, voucher_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS multi_cheques (id INT, amount DECIMAL, description STRING, multicheque_number STRING, status INT, type INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, party_type STRING, party_id INT, account_id INT, branch_id INT) PARTITIONED BY (multicheque_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS multipliers (id INT, name STRING, value DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS new_joiners_orientation (id INT, name STRING, description STRING, code STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS new_joiners_orientation_attendee (id INT, employee_id INT, orientation_id INT, detail_id INT, topic_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS new_joiners_orientation_details (id INT, orientation_id INT, topic_id INT, organizer STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT) PARTITIONED BY (`date` DATE, `time` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS new_joiners_orientation_topic (id INT, name STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS night_bill_config_info (id INT, shift_id INT, hour INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS numbers_generator (id INT, key STRING, value INT, status INT, end_value INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS odd_entry_adjustments (id INT, code STRING, employee_leave_id INT, employee_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, transaction_id INT, own_approval INT, remarks STRING, end_time STRING, device_data_id INT) PARTITIONED BY (adjustment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS opportunities (id INT, name STRING, campaign_id INT, currency STRING, amount DECIMAL, next_step STRING, source_id INT, party_id INT, type INT, assign_to INT, team_id INT, description STRING, status INT, profitability DECIMAL, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (closing_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS opportunity_source (id INT, name STRING, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_amendments (id INT, order_id INT, amendment_date TIMESTAMP, ci_number STRING, created_by INT, created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_bom_outlines (id INT, name STRING, page_title STRING, category_filter INT, category_filter_for_product_search INT, product_category_1 INT, product_category_2 INT, product_category_3 INT, product_category_4 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_expense_purposes (id INT, purpose_id INT, amount DECIMAL, src_amount DECIMAL, voucher_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_invoice_products (id INT, invoice_id INT, product_id INT, unit_cost DECIMAL, quantity DECIMAL, total DECIMAL, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_invoices (id INT, invoice_number STRING, order_id INT, invoice_amont DECIMAL, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (invoice_date DATE, received_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_item_diffs (id INT, amendment_id INT, order_item_id INT, product_id INT, old_quantity DECIMAL, old_unit_cost DECIMAL, old_total DECIMAL, new_quantity DECIMAL, new_unit_cost DECIMAL, new_total DECIMAL, old_src_total DECIMAL, new_src_total DECIMAL, old_src_unit_cost DECIMAL, new_src_unit_cost DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_item_warranty_negotiations (id INT, order_id INT, product_id INT, serial STRING, party_id INT, warranty_duration INT, created_by INT, updated_by INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, description INT) PARTITIONED BY (warranty_start_date DATE, warranty_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_items (id INT, order_id INT, product_id INT, type INT, serial STRING, quantity DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, vat DECIMAL, discount_per_product DECIMAL, discount DECIMAL, total DECIMAL, proforma_id INT, src_unit_cost DECIMAL, src_total DECIMAL, custom_field_1 STRING, custom_field_2 STRING, description STRING, project_id INT, feature_sheet STRING, deliverable_quantity DECIMAL, deliverable_amount DECIMAL, warranty INT, src_discount DECIMAL, src_vat DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, deleted TINYINT, total_expense DECIMAL, delivered_expense DECIMAL, carton_quantity DECIMAL, carton_capacity DECIMAL, po_id INT, wo_id INT, note DECIMAL, total_note_amount DECIMAL, free_product_qty DECIMAL, chassis STRING, engine STRING, tax_1 DECIMAL, tax_2 DECIMAL, tax_3 DECIMAL, unit_of_measurement_id INT, carton_loose_pcs DECIMAL, general_discount_percent DECIMAL, special_discount_percent DECIMAL, general_discount DECIMAL, special_discount DECIMAL, tax_4 DECIMAL, product_code STRING, barcode STRING, total_general_discount DECIMAL, total_trade_discount DECIMAL, display_quantity DECIMAL, provision_1 DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, quantity_2 DECIMAL, is_asset TINYINT, trade_discount DECIMAL, entry_order INT, product_type STRING, commission DECIMAL, commission_percent DECIMAL, performance_guarantee_percent DECIMAL, performance_guarantee DECIMAL, min_mrp DECIMAL, delivery_id INT, discount_3 DECIMAL, discount_4 DECIMAL, discount_5 DECIMAL, total_discount_3 DECIMAL, total_discount_4 DECIMAL, total_discount_5 DECIMAL, brokerage_percent DECIMAL, brokerage DECIMAL, rebate_percent DECIMAL, rebate DECIMAL, beam_no STRING, roll_number STRING, quality_code STRING, extra_quality_code STRING, qty_points INT, gross_weight DECIMAL, calculated_actual_weight DECIMAL, width_uom DECIMAL, no_of_pieces DECIMAL, grade STRING, display_gross_weight DECIMAL, display_calculated_actual_weight DECIMAL, vat_included_flag INT, unit_cost_with_vat DECIMAL, ait_percent DECIMAL, additional_charge_id INT, additional_charge_value DECIMAL, additional_charge2_id INT, additional_charge3_id INT, additional_charge4_id INT, additional_charge2_value DECIMAL, additional_charge3_value DECIMAL, additional_charge4_value DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_purposes (id INT, name STRING, label STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_sheet_calculations (id INT, order_sheet_id INT, motor STRING, manual STRING, cwidth DECIMAL, cheight DECIMAL, bwidth DECIMAL, bheight DECIMAL, tube DECIMAL, gch_length DECIMAL, gch_extra DECIMAL, slat_qty DECIMAL, sheight DECIMAL, swidth DECIMAL, tpcs DECIMAL, bracket DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_sheets (id INT, party_id INT, type INT, slat_id INT, box_color STRING, slat_color STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, total_cwidth DECIMAL, total_cheight DECIMAL, total_tube DECIMAL, total_gch_length DECIMAL, total_slat_qty DECIMAL, total_swidth DECIMAL, end_slat DECIMAL, total_tpcs DECIMAL, custom_field_1 STRING, total_order DECIMAL, description STRING, project_id INT, party_type STRING, status INT, approved_by INT) PARTITIONED BY (order_date DATE, delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS order_vouchers (id INT, order_id INT, voucher_id INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS organization_billing_address (id INT, organization_id INT, house STRING, road STRING, section STRING, division_id INT, city_id INT, thana_id INT, post_code_id INT, post_office_id INT, country_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS organization_contacts (id INT, organization_id INT, primary_contact INT, first_name STRING, last_name STRING, mobile STRING, others_phone STRING, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS organization_email_address (id INT, organization_id INT, email_address STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS organization_shipping_address (id INT, organization_id INT, house STRING, road STRING, section STRING, division_id INT, city_id INT, thana_id INT, post_code_id INT, post_office_id INT, country_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS organizations (id INT, organization_name STRING, office_phone STRING, annual_revenue DECIMAL, created TIMESTAMP, updated TIMESTAMP, description STRING, employees INT, alternative_phone STRING, ownership STRING, rating DECIMAL, ticker_symbol STRING, account_type INT, website STRING, customer_id INT, business_type_id INT, category_type_id INT, employee_id INT, assign_to INT, source INT, ref_description STRING, company_rating INT, parent_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS other_parties (id INT, base_party_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS overtime_registers (id INT, employee_id INT, branch_id INT, department_id INT, shift_id INT, ot_type INT, start_time STRING, end_time STRING, duration DECIMAL, status INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, own_approval INT, transaction_id INT, extra_ot_duration DECIMAL) PARTITIONED BY (effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS pa_criteria_wise_ratings (id INT, criteria_id INT, label STRING, code DOUBLE, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, outline_id INT, employee_id INT, kpi_type INT, employee_wise_outline_id INT, quantitive_value INT, evaluation_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS package_products (id INT, package_id INT, product_id INT, unit_cost DECIMAL, quantity DECIMAL, status INT, updated TIMESTAMP, created_by INT) PARTITIONED BY (`start` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS packages (id INT, name STRING, status INT, description STRING, updated TIMESTAMP, created_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS packing (id INT, order_no INT, delivery_no INT, type INT, party_id INT, total_qty DECIMAL, country_of_origin INT, bill_to INT, shipping_address STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT, name STRING, code STRING, product_id INT, outline STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS packing_data (id INT, packing_id INT, `start` DECIMAL, `end` DECIMAL, color STRING, size STRING, batch STRING, material STRING, ref_no STRING, cartoon_capacity DECIMAL, qty_kgs DECIMAL, net_qty DECIMAL, gross_qty DECIMAL, net_qty_kgs DECIMAL, gross_qty_kgs DECIMAL, cartoon_dimension DECIMAL, multi_product INT, model STRING, tracking_number STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, delivery_id INT, total_product_qty DECIMAL, left_product_qty DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS packing_outline (id INT, name STRING, code STRING, `start` INT, `end` INT, color INT, size INT, batch INT, material INT, ref_no INT, cartoon_capacity INT, qty_kgs INT, net_qty INT, gross_qty INT, net_qty_kgs INT, gross_qty_kgs INT, cartoon_dimension INT, multi_product INT, model INT, tracking_number INT, start_label STRING, end_label STRING, color_label STRING, size_label STRING, batch_label STRING, material_label STRING, ref_no_label STRING, cartoon_capacity_label STRING, qty_kgs_label STRING, net_qty_label STRING, gross_qty_label STRING, net_qty_kgs_label STRING, gross_qty_kgs_label STRING, cartoon_dimension_label STRING, multi_product_label STRING, model_label STRING, tracking_number_label STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS parties (id INT, first_name STRING, last_name STRING, middle_name STRING, full_name STRING, full_name_bn STRING, print_as STRING, title INT, nick STRING, suffix STRING, gender INT, marital_status INT, comment STRING, passport STRING, national_id STRING, phone STRING, alt_phone STRING, email STRING, alt_email STRING, mobile STRING, alt_mobile STRING, fax STRING, website STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, subtype INT, role INT, parent_id INT, updated_by INT, opening_balance DECIMAL, journal_id INT, branch_id INT, code STRING, barcode STRING, pin_number STRING, currency STRING, inactive TINYINT, deleted TINYINT, type STRING, late_fee_policy_id INT, religion STRING, religion_id INT, nationality STRING, father_name STRING, mother_name STRING, spouse STRING, no_of_children INT, height STRING, weight STRING, blood_group STRING, credit_limit DECIMAL, credit_limit_check TINYINT, credit_days INT, blocked TINYINT, skype STRING, phone_prefix STRING, whatsapp STRING, facebook STRING, party_group_id INT, credit_days_check TINYINT, gstin STRING, shipping_gstin STRING, shipping_careof STRING, miscellaneous_data STRING, meter_id INT, meter_number STRING, bin STRING, etin STRING, service_package_id INT, service_contract_id INT, additional_branches_id STRING, alt_mob_prefix STRING, mob_prefix STRING, bank_type INT, is_approved INT, approved_by INT, approved_at TIMESTAMP) PARTITIONED BY (birthday DATE, entry_date DATE, marriage_day DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_accounts (id INT, party_id INT, account_name STRING, account_number STRING, bank_id INT, routing_number STRING, type INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, description STRING, is_default INT, updated_by INT, inactive TINYINT, deleted TINYINT, bank_branch_id INT, customer_id STRING, card_number STRING) PARTITIONED BY (opening_date DATE, `start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_activities (id INT, subject STRING, employee_id INT, party_id INT, party_type_str STRING, contact_id INT, person STRING, phone_number STRING, email STRING, address STRING, designation STRING, description STRING, activity_type INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, model_name STRING, model_id INT, status INT, public_private INT, priority INT, start_time STRING, end_time STRING, activity_action_id INT, parent_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_activity_employees (id INT, party_activity_id INT, employee_id INT, employee_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_addresses (id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, party_id INT, address_id INT, type INT, is_primary TINYINT, `order` INT, inactive TINYINT, deleted TINYINT, updated_by INT, default INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_categories (id INT, name STRING, display_name STRING, party_type STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_items (id INT, party_id INT, item_id INT, party_type STRING, party_subtype STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_ledgers (id INT, journal_id INT, voucher_id INT, party_id INT, party_role_id INT, amount DECIMAL, src_currency STRING, src_amount DECIMAL, description STRING, project_id INT, branch_id INT, inactive TINYINT, deleted TINYINT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_nominees (id INT, name STRING, marital_status INT, relation INT, type INT, present_address_id INT, permanent_address_id INT, percentage DECIMAL, party_id INT, national_id STRING, birth_certificate STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, address STRING, mobile STRING, employee_family_member_id INT, nominee_guardian_id INT, nominee_guardian_relationship INT) PARTITIONED BY (dob DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_outlines (id INT, type STRING, subtype STRING, subtype_title STRING, account_sheet STRING, has_address TINYINT, has_account TINYINT, has_user TINYINT, transactional TINYINT, updated TIMESTAMP, updated_by INT, created TIMESTAMP, created_by INT, inactive TINYINT, deleted TINYINT, url_param STRING, item_enlistment TINYINT, party_branch TINYINT, fathers_name TINYINT, pin_number TINYINT, miscellaneous_key STRING, credit_days_mandatory TINYINT, credit_limit_mandatory TINYINT, branch_id_mandatory TINYINT, phone_mandatory TINYINT, mobile_mandatory TINYINT, meter_information TINYINT, auto_mail TINYINT, bin TINYINT, etin TINYINT, additional_info_for_vehicle_management INT, prefix STRING, name_mandatory INT, father_name_mandatory INT, national_id_mandatory INT, address_info_mandatory INT, contact_person_mandatory INT, membership_card_type INT, card_expiry_date INT, additional_info_for_vehicle_management_mandatory INT, marriage_day INT, email_mandatory INT, category_mandatory INT, unique_mobile INT, unique_email INT, unique_nid INT, alt_phone_mandatory INT, driving_license_mandatory INT, minimal_customer_add_page INT, multiple_contact_person TINYINT, personal_info INT, personal_contact_info INT, account_info INT, entry_date_readonly INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_project_tags (id INT, project_id INT, party_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_roles (id INT, party_id INT, type INT, role_number STRING) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_supervisors (id INT, party_id INT, party_role STRING, other_party_id INT, other_party_role STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, organogram_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS party_users (id INT, user_id INT, party_id INT, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS paygrade_levels (id INT, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS paygrades (id INT, name STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, rank INT, branch_id_list STRING, level INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payment_method_outlines (id INT, name STRING, code STRING, cash INT, cheque INT, bankdeposit INT, card INT, bkash INT, beftn INT, rtgs INT, rocket INT, nagad INT, ukash INT, surecash INT, mobilebanking INT, adjustment INT, payorder INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_accounts (id INT, voucher_id INT, payroll_schedule_id INT, payroll_payment_id INT, payroll_earning_id INT, repayment_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_earnings (id INT, name STRING, bonus_id INT, status INT, description STRING, payroll_item_id INT, account_id INT, voucher_id INT, reason INT, amount DECIMAL, payroll_schedule_id INT, contra_account_id INT, branch_id INT, deleted TINYINT, `percent` DECIMAL, inactive TINYINT, created TIMESTAMP, created_by INT, cost_segment_id INT, refundable_deduction TINYINT, tax_deduction TINYINT, workflow_status INT, transaction_id INT, own_approval INT, revenue_stamp_deduction INT, pf_deduction INT) PARTITIONED BY (entry_date DATE, start_from DATE, end_at DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_item_location_dependencies (id INT, payroll_item_id INT, location_id INT, value DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_items (id INT, name STRING, print_as STRING, amount DECIMAL, partial_amount DECIMAL, type INT, min_amount DECIMAL, expense_account INT, liability_account INT, limit DECIMAL, is_refundable TINYINT, is_basic TINYINT, rounding_after INT, multiplier INT, divisor INT, calculation_type INT, partial_calculation_type INT, taxable TINYINT, partial_view TINYINT, tax_exemption_type_id INT, tax_setting_type_id INT, exemption_in_percent DECIMAL, exemption_max_amount DECIMAL, taxable_amount_in_percent DECIMAL, taxable_min_amount DECIMAL, accommodation_exemption_in_percent_of_paid_rent DECIMAL, include_in_salary TINYINT, display_text STRING, description STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, pf_employee_contribution INT, pf_employer_contribution INT, pf_employer_contribution_on INT, employer_contrib_percent DECIMAL, is_meal INT, guest_meal_calculation INT, guest_meal_amount DECIMAL, full_present_slab_calculation INT, payment_method INT, show_in_payslip INT, piecework INT, prorata INT, refund_percentage DECIMAL, refund_month INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_payments (id INT, reason INT, name STRING, amount DECIMAL, status INT, description STRING, payroll_item_id INT, payroll_earning_id INT, payroll_schedule_id INT, account_id INT, voucher_id INT, contra_account_id INT, branch_id INT, is_regular_payment TINYINT, payment_method_type INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, payroll_earning_id_list STRING, workflow_status INT, own_approval INT, transaction_id INT, multicurrency_gain_loss_amount DECIMAL) PARTITIONED BY (entry_date DATE, start_from DATE, end_at DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_reimbursements (id INT, employee_id INT, schedule_id INT, payroll_item_id INT, ref_doc_number STRING, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_schedule_outlines (id INT, pre_calculation_path STRING, key INT, name STRING, view_template STRING, edit_template STRING, builtin TINYINT, inactive TINYINT, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_schedules (id INT, name STRING, print_as STRING, frequency_type INT, type INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, parent_id INT, updated_by INT, branch_id INT, branch_id_list STRING) PARTITIONED BY (`start` DATE, `end` DATE, check_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_subschedule (id INT, payroll_schedule_id INT, code STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payroll_vendors (id INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payscale_data (id INT, payroll_item_id INT, payscale_id INT, grade_id INT, amount DECIMAL, partial_amount DECIMAL, calculated_amount DECIMAL, min_amount DECIMAL, limit DECIMAL, is_refundable TINYINT, is_basic TINYINT, rounding_after INT, multiplier INT, divisor INT, calculation_type INT, partial_calculation_type INT, taxable INT, partial_view INT, tax_exemption_type_id INT, tax_setting_type_id INT, exemption_in_percent DECIMAL, exemption_max_amount DECIMAL, taxable_amount_in_percent DECIMAL, taxable_min_amount DECIMAL, accommodation_exemption_in_percent_of_paid_rent DECIMAL, include_in_salary DECIMAL, is_modified INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, `order` INT, pf_employee_contribution INT, pf_employer_contribution INT, pf_employer_contribution_on INT, employer_contrib_percent DECIMAL, is_meal INT, guest_meal_calculation INT, guest_meal_amount DECIMAL, full_present_slab_calculation INT, payment_method INT, show_in_payslip INT, piecework_calculated_amount DECIMAL, sales_validator INT, sales_amount INT, sales_count INT, attendance_validator INT, min_leave_days INT, min_absent_days INT, min_leave_absent INT, attendance_based_item_percent DECIMAL, sales_based_item_percentage DECIMAL, kpi_based_salary_config_id INT, lwop_impact INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS payscale_grades (id INT, payscale_id INT, grade_id INT, calculation_type INT, increment_type INT, amount_from DECIMAL, amount_to DECIMAL, increment_amount DECIMAL, increment_quantity DECIMAL, eb_amount DECIMAL, eb_quantity DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS payscale_grades_slab (id INT, name STRING, code STRING, payscale_id INT, grade_id INT, payscale_grade_id INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS payscale_grades_slab_details (id INT, payscale_grades_slab_id INT, amount DECIMAL, code STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS payscales (id INT, name STRING, print_as STRING, amount DECIMAL, gross_calculation TINYINT, percent_of_basic DECIMAL, description STRING, parent_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, code STRING, branch_id_list STRING, currency_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey (id INT, title STRING, topic STRING, type INT, target_party STRING, estimated_outcome DECIMAL, budget DECIMAL, campaign_id INT, survey_lead_id INT, assigned_to INT, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, survey_number STRING, project_id INT, model_type INT, training_requisition_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_basics (id INT, survey_number STRING, title STRING, description STRING, survey_type STRING, project_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, parent_survey_basic_id INT, survey_stage INT, template_for STRING, engine_no STRING, chassis_no STRING, template_id INT, has_performed INT, level INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_forms (id INT, survey_basic_id INT, survey_question_id INT, question_response STRING, submission_time TIMESTAMP, submitted_by_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, image_url STRING, comment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_options (id INT, type INT, option STRING, narration STRING, attachment STRING, survey_question_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_queries (id INT, title STRING, description STRING, question_options STRING, question_type INT, question_group_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, serial_no INT, display_serial STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_question_groups (id INT, title STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_questions (id INT, question_type INT, question STRING, narration STRING, attachment STRING, survey_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_responsed_answers (id INT, survey_responsed_question_id INT, answer STRING, survey_options_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_responsed_questions (id INT, survey_response_id INT, question_id INT, question_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pdi_survey_responses (id INT, party_id INT, survey_submit_date TIMESTAMP, survey_id INT, survey_rating INT, remarks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, issue_type INT, issue INT, ref_survey_response INT, response_survey_number STRING, model_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performace_criteria_units_of_measurement (id INT, name STRING, symbol STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_criteria (id INT, name STRING, group_id INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, weightage DECIMAL, unit_of_measurement_id INT, criteria_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_criteria_group (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, category_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_employeelists (id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_group_categories (id INT, name STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, `order` INT, editable INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_kpi_item_wise_remarks (id INT, employee_id INT, appraisal_id INT, appraiser_id INT, kpi_group_id INT, criteria_id INT, task_id INT, quantitative_score INT, qualitative_score INT, remarks STRING, created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_outline_details (id INT, outline_id INT, criteria_id INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, description STRING, weightage DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_outline_group_weightages (id INT, outline_id INT, criteria_group_id INT, group_weightage DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_outline_pointing_level_weightages (id INT, name STRING, outline_id INT, pointing_weightage DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_outlines (id INT, name STRING, rating_system_id INT, department_id INT, designation_id INT, total_points DECIMAL, verifier_id INT, approver_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, approval_status INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, department_level_5 INT, department_level_6 INT, branch_id INT, payscale_id INT, paygrade_id INT, status INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_rating_system (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, rating_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_appraisal_ratings (id INT, name STRING, code STRING, rating_system_id INT, point INT, start_percent INT, end_percent INT, increment INT, preferred_action_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_criteria (id INT, name STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by STRING, updated TIMESTAMP, updated_by STRING, unit_of_measurement_id INT, calculation_type INT, criteria_type INT, rating_system_id INT, sales_parameter_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_score_summaries (id INT, appraisal_id INT, total_rating_point DECIMAL, total_weightage_rating_score DECIMAL, status INT, employee_id INT, frequency_type INT, frequency_value STRING) PARTITIONED BY (appraisal_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS performance_submitted_status (id INT, appraisal_id INT, appraiser_id INT, status INT, remarks STRING, total_weightage_rating DECIMAL, total_without_weightage_rating DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS pf_contribution_slabs (id INT, name STRING, count_after INT, slab_start INT, slab_end INT, employee_contribution_percent DECIMAL, employee_contribution_on INT, employee_contribution_formula STRING, employer_contribution_percent DECIMAL, employer_contribution_on INT, employer_contribution_formula STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pf_refund_rules (id INT, ser_duration_from DECIMAL, ser_duration_to DECIMAL, employee_con_percent DECIMAL, employer_con_percent DECIMAL, employee_income_gain_percent DECIMAL, employer_income_gain_percent DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS piece_rates (id INT, description STRING, piece_id INT, order_id INT, order_product_id INT, local_rate DECIMAL, exchange_rate DECIMAL, rate_in_secondary_currency DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, code STRING) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS piecework_employees (id INT, employee_id INT, piece_id INT, order_id INT, min_target DECIMAL, target_type INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, order_product_id INT) PARTITIONED BY (assigned_from DATE, assigned_to DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS piecework_rates (id INT, style STRING, size STRING, step_id INT, amount DECIMAL, inactive TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pieceworks (id INT, employee_id INT, department_id INT, schedule_id INT, rate DECIMAL, quantity INT, comment STRING, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, order_id INT, order_product_id INT, piece_id INT, rate_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ping_adc (id INT, url STRING, email STRING, note STRING, status INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, serial_number BIGINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS plan_products (id INT, plan_id INT, product_id INT, unit_cost DECIMAL, discount_per_product DECIMAL, quantity DECIMAL, status INT, updated TIMESTAMP, created_by INT, total DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT) PARTITIONED BY (`start` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS plans (id INT, name STRING, status INT, description STRING, updated TIMESTAMP, created_by INT, currency STRING, total DECIMAL, deleted TINYINT, inactive TINYINT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS portlets (id INT, header STRING, url STRING, custom_field_1 STRING, internal_name STRING, bgcolor STRING, data_url STRING, config STRING, type STRING, is_updated INT, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS pos_quick_products (id INT, product_id STRING, created_by TINYINT, created TIMESTAMP, updated_by TINYINT, updated TIMESTAMP, terminal_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pos_so_logs (id INT, product_id INT, branch_id INT, sl INT, grid_row_number INT, quantity DECIMAL, vat DECIMAL, discount DECIMAL, sale_price DECIMAL, barcode STRING, product_code STRING, product_name STRING, ref_invoice_no STRING, terminal_code STRING, event STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by STRING, created TIMESTAMP, updated_by STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS pos_terminals (id INT, name STRING, code STRING, branch_id INT, default_card_device_id INT, inventory_id INT, cash_bank_account_id INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS position_code_outlines (id INT, name STRING, dept_level_1 INT, dept_level_2 INT, dept_level_3 INT, dept_level_4 INT, dept_level_5 INT, dept_level_6 INT, position_level INT, designation_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS position_indices (id INT, position_id STRING, parent_id INT, dept_level_1 INT, dept_level_2 INT, dept_level_3 INT, dept_level_4 INT, dept_level_5 INT, dept_level_6 INT, inactive INT, deleted INT, employee_id INT, designation_id INT, created_by INT, updated_by INT, dept_detail_id_1 INT, dept_detail_id_2 INT, dept_detail_id_3 INT, dept_detail_id_4 INT, dept_detail_id_5 INT, dept_detail_id_6 INT, position_level INT, job_location_id INT, branch_id INT, is_posted INT) PARTITIONED BY (`start` DATE, `end` DATE, created DATE, updated DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS post_vacancy (id INT, posting_number STRING, vacancy_id INT, agency_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, backref INT) PARTITIONED BY (entry_date DATE, posting_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS post_vacancy_summary_info (id INT, post_vacancy_id INT, posting_number STRING, vacancy_number STRING, position_id STRING, position_code STRING, job_title STRING, job_details_url_endpoint STRING, allowed_departments STRING, manpower_quantity INT, status INT, is_notified INT, job_thumbnail_url STRING) PARTITIONED BY (expired_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS potential (id INT, potential_name STRING, potential_owner_id INT, leads_id INT, next_step STRING, description STRING, amount DECIMAL, expected_revenue DECIMAL, sales_stage_id INT, probability INT, status INT, potential_code STRING, inactive TINYINT, branch_id INT, created_by INT, top_deal INT, classification STRING) PARTITIONED BY (closing_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS potential_competitors (id INT, potential_id INT, competitor_name STRING, product_name STRING, product_price DECIMAL, probability INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS potential_sales_stage_changes (id INT, potential_id INT, sales_stage_id INT, updated_by INT, remarks STRING, prev_sales_stage_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS potential_status_changes (id INT, potential_id INT, status INT, prev_status INT, updated_by INT, remarks STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS pre_costing (id INT, name STRING, production_id STRING, factory_id INT, ordered_product_qty INT, predicted_total_raw_cost DECIMAL, predicted_other_expense DECIMAL, predicted_production_cost DECIMAL, status INT, currency STRING, exchange_rate DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, workorder_id INT, production_program_id INT) PARTITIONED BY (entry_date DATE, production_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS pre_costing_expenses (id INT, pre_costing_id INT, type INT, total_labour DECIMAL, cost_per_labour DECIMAL, expense_amount DECIMAL, purpose STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS pre_costing_products (id INT, pre_costing_id INT, product_id INT, quantity INT, size STRING, profit_margin DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS price_protection_order_items (id INT, order_id INT, product_id INT, type INT, serial STRING, quantity DECIMAL, pp_value DECIMAL, total_pp_value DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, vat DECIMAL, discount_per_product DECIMAL, discount DECIMAL, total DECIMAL, proforma_id INT, src_unit_cost DECIMAL, src_total DECIMAL, custom_field_1 STRING, custom_field_2 STRING, description STRING, project_id INT, feature_sheet STRING, deliverable_quantity DECIMAL, deliverable_amount DECIMAL, warranty INT, src_discount DECIMAL, src_vat DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, deleted TINYINT, total_expense DECIMAL, delivered_expense DECIMAL, carton_quantity DECIMAL, carton_capacity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS prism_dms_credentials (id INT, dms_url STRING, api_client_secret STRING, api_access_identification_key STRING, user_type STRING, created TIMESTAMP, updated TIMESTAMP, dms_api_test_url STRING, client_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_flows (id INT, name STRING, from_event STRING, to_event STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_floors (id INT, name STRING, identifier STRING, section_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_journals (id INT, po_id INT, wo_id INT, dest_po_id INT, request_id INT, floor_id INT, dest_floor_id INT, line_id INT, dest_line_id INT, production_type INT, party_id INT, is_leftover TINYINT, from_po_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_lines (id INT, name STRING, identifier STRING, floor_id INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_productions (id INT, po_id INT, dest_po_id INT, request_id INT, floor_id INT, dest_floor_id INT, line_id INT, dest_line_id INT, production_type INT, from_po_id INT, wo_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_purchase_orders (id INT, wo_id INT, po_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_section_items (id INT, item_id INT, section_id INT, raw_item TINYINT, finished_item TINYINT, created_by INT, updated_by INT, created TIMESTAMP, type INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS process_inventory_sections (id INT, name STRING, identifier STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_costing_method (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_equip_capacities (id INT, prod_equipment_id INT, product_id INT, capacity_per_hour DECIMAL, uom_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, item_id INT, variant_1 INT, variant_2 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_equip_statuses (id INT, prod_equipment_id INT, prod_status_id INT, entry_time TIMESTAMP, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_equipment_allocs (id INT, prod_equipment_id INT, prod_schedule_id INT, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, prod_unit_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_equipment_groups (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, no_of_machines INT, branch_id INT, no_of_frequency INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_equipments (id INT, prod_equipment_grp_id INT, parent_equipment_id INT, name STRING, code STRING, description STRING, prod_unit_id INT, type INT, maximum_runtime DECIMAL, maintenance_duration INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_events (id INT, name STRING, code STRING, event_type INT, built_in INT, multiplier INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_industry_types (id INT, name STRING, code STRING, is_default INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_mps_line_allocs (id INT, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, `start` TIMESTAMP, duration INT, duration_hr INT, `end` TIMESTAMP, branch_id INT, project_id INT, unit_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, no_of_machines INT, no_of_operators INT, available_machines INT, free_machines INT, workcenter_id INT, locked INT, status INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_order_items (id INT, code STRING, prod_order_id INT, item_id INT, product_id INT, prod_process_id INT, quantity DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, variant_1_text STRING, variant_2_text STRING, variant_3_text STRING, variant_4_text STRING, variant_5_text STRING, variant_6_text STRING, tolerance DECIMAL, max_quantity DECIMAL, quantity_produced DECIMAL, quantity_remaining DECIMAL, quantity_shipped DECIMAL, description STRING, uom_id INT, item_text STRING, product_text STRING, uom_text STRING, prod_process_text STRING, style_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_order_master_plannings (id INT, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, `start` TIMESTAMP, duration INT, duration_hr INT, `end` TIMESTAMP, branch_id INT, project_id INT, unit_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, workcenter_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_order_outlines (id INT, name STRING, code STRING, page_title STRING, prefix STRING, description STRING, workcenter_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_orders (id INT, prod_schedule_id INT, order_id INT, ref_order_number STRING, order_number STRING, customer_id INT, merchandiser_id INT, manager_id INT, status INT, branch_id INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, order_type STRING, issue_inventory_id INT, production_inventory_id INT, prod_unit_id INT, machine_id INT, accessory_id INT, prod_shift_id INT, prod_purpose_id INT, prod_type INT, work_order_id INT, outline_id INT, sample_order_id INT, project_id INT, priority INT, weight INT, cost_center_id INT) PARTITIONED BY (entry_date DATE, target_start_date DATE, start_date DATE, target_end_date DATE, end_date DATE, due_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_package_products (id INT, prod_package_id INT, product_id INT, quantity DECIMAL, serials STRING, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, variant_1_text STRING, variant_2_text STRING, variant_3_text STRING, variant_4_text STRING, variant_5_text STRING, variant_6_text STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, uom_id INT, product_text STRING, uom_text STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_packages (id INT, prod_order_id INT, net_weight DECIMAL, dimension STRING, package_number STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, barcode STRING, branch_id INT) PARTITIONED BY (packing_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_personnels (id INT, employee_id INT, name STRING, prod_job_title_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, code STRING, workcenter_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_proc_pipe_line (id INT, prod_proc_step_id INT, event_id INT, is_final INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_proc_step_items (id INT, prod_proc_step_id INT, prod_event_id INT, product_type INT, product_id INT, uom_type INT, calculate_in_bom INT, quantity DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, variant_1_text STRING, variant_2_text STRING, variant_3_text STRING, variant_4_text STRING, variant_5_text STRING, variant_6_text STRING, rank INT, unit_cost DECIMAL, est_cost DECIMAL, actual_cost DECIMAL, multiplier INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, uom_id INT, item_id INT, item_text STRING, product_text STRING, uom_text STRING, prod_equipment_id INT, prod_equipment_text STRING, cost_multiplier DECIMAL, weightage DECIMAL, style_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_proc_steps (id INT, name STRING, code STRING, sbu_id INT, prod_step_group_id INT, prod_process_id INT, pcw_piece_rate_code STRING, show_detail_input INT, manpower INT, prod_equipment_id INT, rank INT, predecessor INT, siblings STRING, successor INT, main_input_of_step INT, main_output_of_step INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, workcenter_id INT, smv DECIMAL, is_sub_contract INT, prod_step_id INT, dependency_type INT, style_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_process_costs (id INT, prod_process_id INT, costing_type STRING, costing_head STRING, calculation_type STRING, amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_processes (id INT, parent_id INT, prod_order_id INT, prod_order_item_id INT, name STRING, code STRING, sbu_id INT, item_id INT, product_id INT, specification STRING, quantity DECIMAL, quantity_produced DECIMAL, quantity_remaining DECIMAL, other_cost DECIMAL, comission DECIMAL, commission_amount DECIMAL, material_cost DECIMAL, unit_cost DECIMAL, total_cost DECIMAL, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, process_type INT, uom_id INT, is_default INT, finalized INT, smv DECIMAL, workcenter_id INT, branch_id INT, smv_calculation_type INT, rate_per_hour DECIMAL, style_id INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, is_child INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_purposes (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_record_items (id INT, production_record_id INT, production_event_id INT, prod_process_id INT, prod_proc_step_id INT, prod_proc_step_item_id INT, product_type INT, product_id INT, target_quantity DECIMAL, estimated_quantity DECIMAL, quantity DECIMAL, wastage DECIMAL, wastage_price_percent DECIMAL, threshold_prop_value DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, variant_1_text STRING, variant_2_text STRING, variant_3_text STRING, variant_4_text STRING, variant_5_text STRING, variant_6_text STRING, multiplier INT, product_serial STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, uom_id INT, actual_time STRING, batch_number STRING, prod_equipment_id INT, item_id INT, item_text STRING, product_text STRING, uom_text STRING, unit_cost DECIMAL, total_cost DECIMAL, prod_equipment_text STRING) PARTITIONED BY (scheduled_date DATE, actual_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_records (id INT, shift_id INT, prod_order_id INT, ref_delivery_id INT, ref_delivery STRING, ref_quantity DECIMAL, record_type INT, prod_process_id INT, prod_proc_step_id INT, prod_event_id INT, prod_unit_id INT, party_id INT, multiplier DECIMAL, party_amount DECIMAL, main_product_quantity DECIMAL, batch_number STRING, raw_mat_qty_1 DECIMAL, raw_mat_qty_2 DECIMAL, raw_mat_qty_3 DECIMAL, raw_mat_qty_4 DECIMAL, raw_mat_qty_5 DECIMAL, raw_mat_qty_6 DECIMAL, raw_mat_qty_7 DECIMAL, raw_mat_qty_8 DECIMAL, raw_mat_qty_9 DECIMAL, raw_mat_qty_10 DECIMAL, mat_con_qty_1 DECIMAL, mat_con_qty_2 DECIMAL, mat_con_qty_3 DECIMAL, mat_con_qty_4 DECIMAL, mat_con_qty_5 DECIMAL, mat_con_qty_6 DECIMAL, mat_con_qty_7 DECIMAL, mat_con_qty_8 DECIMAL, mat_con_qty_9 DECIMAL, mat_con_qty_10 DECIMAL, finish_qty_1 DECIMAL, finish_qty_2 DECIMAL, finish_qty_3 DECIMAL, finish_qty_4 DECIMAL, finish_qty_5 DECIMAL, wastage_qty_1 DECIMAL, wastage_qty_2 DECIMAL, wastage_qty_3 DECIMAL, return_qty_1 DECIMAL, return_qty_2 DECIMAL, return_qty_3 DECIMAL, return_qty_4 DECIMAL, return_qty_5 DECIMAL, other_qty_1 DECIMAL, other_qty_2 DECIMAL, other_qty_3 DECIMAL, other_qty_4 DECIMAL, other_qty_5 DECIMAL, other_qty_6 DECIMAL, status INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, production_time STRING, prod_personnel_id INT, shift_duration DECIMAL, branch_id INT, inventory_id INT, wastage_inventory_id INT, ref_record_id INT, record_identifier STRING, source_prod_unit_id INT, ref_record_id_list STRING, approval_order INT, ref_record_info_dict STRING, source_prod_order_id INT, source_prod_process_id INT, source_process_step_id INT, is_transfer INT, parent_id INT, acknowledge INT, cost_center_id INT, from_pipe_line INT) PARTITIONED BY (scheduled_date DATE, production_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_schedule_data (id INT, prod_schedule_info_id INT, prod_order_id INT, prod_order_item_id INT, prod_process_id INT, prod_product_id INT, prod_uom_id INT, target_quantity DECIMAL, return_quantity DECIMAL, percent_achieved DECIMAL, variance DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, achieved_quantity DECIMAL, serial_no INT, prod_process_text STRING, prod_product_text STRING, prod_uom_text STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_schedule_infos (id INT, code STRING, name STRING, prod_unit_id INT, parent_id INT, auto_create_pattern STRING, is_auto INT, status INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, schedule_type STRING, is_holiday INT, holiday_type_id INT, holiday_id INT, year_type STRING, branch_id INT) PARTITIONED BY (opening_date DATE, ending_date DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_sets (id INT, name STRING, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_shipment_packages (id INT, prod_shipment_id INT, prod_package_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_package_text STRING, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_shipments (id INT, prod_order_id INT, destination STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_si_ancestors (id INT, prod_si_id INT, parent_si_id INT, depth INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_statuses (id INT, for_model STRING, code STRING, description STRING, rank INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_step_groups (id INT, name STRING, code STRING, icon STRING, color STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, rank INT, branch_id INT, unit_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_steps (id INT, name STRING, code STRING, step_group_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, rank INT, workcenter_id INT, lag_time INT, setup_time INT, weight INT, main_step INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_unit_ancestors (id INT, code STRING, prod_unit_id INT, parent_prod_unit_id INT, depth INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_unit_types (id INT, name STRING, code STRING, parent_unit_type INT, rank INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_units (id INT, name STRING, code STRING, prod_unit_type INT, parent_unit INT, manager_id INT, branch_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, last_level INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS prod_user_accesses (id INT, access_code INT, user_id INT, prod_unit_id INT, prod_step_group_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_personnel_id INT, view_costing INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_barcodes (id INT, product_id INT, barcode STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_batch_products (id INT, product_id INT, product_barcode STRING, product_sku STRING, expiry_applicable INT, expiry_duration INT, product_batch_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (expiry_information DATE, entry_date DATE, expiry_start_date DATE, expiry_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_batches (id INT, label STRING, code STRING, identification_code STRING, product_id INT, product_barcode STRING, product_sku INT, warranty_applicable INT, warranty_period INT, expiry_applicable INT, expiry_duration INT, has_serial INT, serial_length INT, serial_start STRING, serial_end STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, voucher_id INT, status INT) PARTITIONED BY (entry_date DATE, expiry_start_date DATE, expiry_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_bom_details (id INT, product_bom_id INT, raw_product_id INT, description STRING, type INT, unit_of_measurement_id INT, wastage_percent DECIMAL, unit_price DECIMAL, quantity DECIMAL, total_price DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, warranty_period INT, is_lifetime INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_boms (id INT, product_id INT, description STRING, mrp DECIMAL, calculated_mrp DECIMAL, whole_sale_price DECIMAL, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_cost_groups (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, order_number INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_costing_proc_items (id INT, process_id INT, prod_event_id INT, product_type INT, product_id INT, uom_type INT, calculate_in_bom INT, quantity DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, variant_1_text STRING, variant_2_text STRING, variant_3_text STRING, variant_4_text STRING, variant_5_text STRING, variant_6_text STRING, rank INT, unit_cost DECIMAL, est_cost DECIMAL, actual_cost DECIMAL, multiplier INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, uom_id INT, item_id INT, item_text STRING, product_text STRING, uom_text STRING, prod_equipment_id INT, prod_equipment_text STRING, cost_multiplier DECIMAL, cost_group_id INT, vendor_id INT, total DECIMAL, material_source_id INT, tolerance_percent DECIMAL, tolerance_cost DECIMAL, country_id INT, tolerance_qty DECIMAL, total_cost_with_tolerance DECIMAL, total_qty_with_tolerance DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_costing_process_other_costs (id INT, product_costing_process_id INT, costing_type STRING, costing_head STRING, calculation_type STRING, amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, quantity DECIMAL, unit_cost DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_costing_processes (id INT, parent_id INT, prod_order_id INT, prod_order_item_id INT, name STRING, code STRING, sbu_id INT, item_id INT, product_id INT, specification STRING, quantity DECIMAL, quantity_produced DECIMAL, quantity_remaining DECIMAL, other_cost DECIMAL, comission DECIMAL, commission_amount DECIMAL, material_cost DECIMAL, unit_cost DECIMAL, total_cost DECIMAL, description STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, prod_industry_type_id INT, process_type INT, uom_id INT, is_default INT, finalized INT, variant_1 INT, variant_2 INT, variant_3 INT, branch_id INT, status INT, party_id INT, inquiry_no STRING, src_currency STRING, margin DECIMAL, grand_total DECIMAL, style_description STRING, cost_method_id INT, sale_price_per_qty DECIMAL, total_sale_price DECIMAL, inquiry_doc_id INT, inquiry_id INT, style_id INT, costing_stage INT, buyer_order_id INT) PARTITIONED BY (inquiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_expense_distributions (id INT, voucher_id INT, voucher_type INT, voucher_number STRING, parent_doc_id INT, product_id INT, commercial_doc_item_id INT, per_product_cost DECIMAL, product_variant STRING, expense_purpose_id INT, serial STRING, serial_2 STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_expiries (id INT, inventory_id INT, inventory_product_id INT, delivery_product_id INT, batch_no STRING, product_id INT, quantity DECIMAL, type INT, order_id INT, custom_field_1 STRING, custom_field_2 STRING, created_by INT, created TIMESTAMP) PARTITIONED BY (expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_features (id INT, product_id INT, feature_id INT, value STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_group_feature_options (id INT, product_group_id INT, feature_id INT, value STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_group_features (id INT, product_group_id INT, feature_id INT, preferred_value STRING, is_required TINYINT, is_variant TINYINT, json_data STRING, rank INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_groups (id INT, name STRING, code STRING, item_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, sub_category_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_lead_times (id INT, product_id INT, vendor_id INT, lead_days INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_life_cycle_status (id INT, from_day INT, to_day INT, status_label STRING, status_color STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_master_prices (id INT, product_id INT, product_code STRING, barcode STRING, product_identifier STRING, base_tp DECIMAL, base_mrp DECIMAL, branch_id INT, vendor_id INT, branch_base_tp DECIMAL, branch_base_mrp DECIMAL, promotion_id INT, promotion_percentage DECIMAL, promotion_amount DECIMAL, discount_percentage DECIMAL, discount_amount DECIMAL, effective_tp DECIMAL, effective_mrp DECIMAL, max_mrp DECIMAL, min_mrp DECIMAL, customer_category_id INT, membership_card_id INT, batch_product_price_id INT, entry_time TIMESTAMP, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, promotional_discount_3_percent DECIMAL, promotional_discount_3 DECIMAL, promotional_discount_4_percent DECIMAL, promotional_discount_4 DECIMAL, promotional_discount_5_percent DECIMAL, promotional_discount_5 DECIMAL) PARTITIONED BY (promotion_start_date DATE, promotion_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_multiunits (id INT, product_id INT, unit_of_measurement_id INT, step_size DECIMAL, mrp DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_outlines (id INT, name STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, raw_product TINYINT, finished_product TINYINT, assembled_product TINYINT, intermediate_product TINYINT, own_product TINYINT, out_product TINYINT, mrp TINYINT, sale_price TINYINT, sale_price2 TINYINT, mrp_text STRING, sale_price_text STRING, sale_price2_text STRING, hs_code_combo TINYINT, hs_code_text STRING, miscellaneous_key STRING, tax_1 TINYINT, tax_2 TINYINT, tax_3 TINYINT, tax_4 TINYINT, tax_1_text STRING, tax_2_text STRING, tax_3_text STRING, tax_4_text STRING, product_description TINYINT, availability_in_so TINYINT, availability_in_po TINYINT, has_sub_product TINYINT, tax_5 TINYINT, tax_6 TINYINT, tax_7 TINYINT, tax_8 TINYINT, tax_5_text STRING, tax_6_text STRING, tax_7_text STRING, tax_8_text STRING, income_acc_id INT, expense_acc_id INT, expiry_duration INT, sale_price3 INT, is_special INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_price_histories (id INT, item_id INT, product_id INT, sale_price DECIMAL, sale_price2 DECIMAL, sale_price3 DECIMAL, provision_1 DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) PARTITIONED BY (effective_date_from DATE, effective_date_to DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_prices (id INT, product_id INT, sale_price DECIMAL, currency STRING, start_date TIMESTAMP, end_date TIMESTAMP, status INT, type INT, sale_price2 DECIMAL, mrp DECIMAL, previous_tp DECIMAL, previous_sale_price DECIMAL, new_tp DECIMAL, new_sale_price DECIMAL, batch_product_price_id INT, code STRING, barcode STRING, vendor_id INT, previous_max_mrp DECIMAL, previous_min_mrp DECIMAL, new_max_mrp DECIMAL, new_min_mrp DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_prices_by_customer_type (id INT, customer_category_id INT, product_id INT, price DECIMAL, discount DECIMAL, discount_percent DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, membership_card_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_raw_materials (id INT, raw_material_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, total DECIMAL, table_name STRING, table_key INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_requisition_outlines (id INT, name STRING, code STRING, show_qty_sum INT, carton_info INT, product_item INT, branch_id_required INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_sales_summary (id INT, product_id INT, branch_id INT, quantity DECIMAL, cost DECIMAL, sale_price DECIMAL, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, status INT, state INT, description STRING, created TIMESTAMP, created_by STRING, inactive TINYINT, deleted TINYINT) PARTITIONED BY (entry_date DATE, from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_segments (id INT, name STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_serial_modify_histories (id INT, product_id INT, order_no STRING, delivery_no STRING, serials STRING, serial_1 STRING, serial_2 STRING, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_serials (id INT, product_id INT, order_no STRING, delivery_no STRING, serial STRING, serials STRING, sl_prefix STRING, sl_start BIGINT, sl_end BIGINT, sl_suffix STRING, sl_count BIGINT, sl_length BIGINT, serial_1 STRING, serial_2 STRING, serial_3 STRING, serial_4 STRING, serial_5 STRING, file_id INT, lot_number STRING, reference_number STRING, div_no INT, warranty_period INT, status INT, deleted TINYINT, inactive TINYINT, file TINYINT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, delivery_ref_number STRING, description STRING, branch_id INT, inventory_id INT, is_transfer TINYINT, delivery_type INT, faulty_status INT) PARTITIONED BY (entry_date DATE, expiry_date DATE, warranty_start DATE, warranty_end DATE, fc_ok_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_serials_mapper (id INT, primary_serial STRING, mapped_serial STRING, product_serial_id INT, delivery_no STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_service_vouchers (id INT, warranty_claim_id INT, voucher_id INT, type INT, status INT, amount DECIMAL, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_settings_emi (id INT, item_id INT, product_id INT, min_tenure INT, max_tenure INT, min_dp_percent DECIMAL, branch_id INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT) PARTITIONED BY (effect_date_start DATE, effect_date_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_settings_uom (id INT, product_id INT, uom INT, factor INT, is_default INT, conversion_rate DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_spec_groups (id INT, name STRING, code STRING, for_main_product INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, serial INT, item_id INT, description STRING, product_id INT, footer STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_spec_items (id INT, product_spec_id INT, spec_group_id INT, name STRING, code STRING, description STRING, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, serial INT, display_serial STRING, spec_group_text STRING, is_featured INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_specifications (id INT, product_id INT, makers_name STRING, makers_code_no STRING, horse_power STRING, cubic_capacity STRING, rpm STRING, laden_weight STRING, max_laden_weight STRING, wheel_base STRING, tyres STRING, overall_length STRING, overall_width STRING, overall_height STRING, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_specs (id INT, name STRING, code STRING, parent_spec_id INT, type INT, item_id INT, product_id INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_sub_products (id INT, parent_product_id INT, sub_product_id INT, unit_of_measurement_id INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_variants (id INT, product_id INT, variant_id INT, updated TIMESTAMP, updated_by INT, variant_code STRING, deleted INT, barcode STRING, inactive INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_variants_values (id INT, product_id INT, variant_id INT, variant_value_id INT, created TIMESTAMP, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT, unit_price DECIMAL, variant_column_name STRING, product_variant_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_vendors (id INT, product_id INT, vendor_id INT, barcode STRING, product_identifier STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_wise_sales_data (id INT, product_id INT, amount DECIMAL, service INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_wise_salestarget_details (id INT, target_id INT, department_id INT, sub_department_id INT, category_id INT, sub_category_id INT, product_id INT, amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_wise_salestargets (id INT, name STRING, branch_id INT, customer_id INT, distribution_method_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_year DATE, end_year DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS product_wise_salestargets_distributions (id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, target_id INT, parent_id INT, amount DECIMAL) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_bonus_settings (id INT, amount_from DECIMAL, amount_to DECIMAL, rate DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_expenses (id INT, production_id INT, expense_amount DECIMAL, purpose STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_order_items (id INT, production_order_id INT, order_items_id INT, style_id INT, item_id INT, product_id INT, feature_sheet STRING, quantity DECIMAL, tolarence_plus DECIMAL, highest_quantity DECIMAL, tolarence_minus DECIMAL, lowest_quantity DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_orders (id INT, order_id INT, order_number STRING, factory_id INT, status INT, manager_1 INT, manager_2 INT, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE, schedule_date DATE, start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_outlines (id INT, step_count INT, name STRING, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_pieces (id INT, name STRING, process_id INT, style_id INT, specialization_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_planning (id INT, production_id INT, production_step_id INT, machine_id INT, employee_id INT, workorder_id INT, start_time STRING, end_time STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_products_forward (id INT, production_id INT, source_step_id INT, destination_step_id INT, workorder_id INT, product_id INT, quantity DECIMAL, inventory_product_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_program_outlines (id INT, step_count INT, name STRING, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_program_steps (id INT, production_program_outline_id INT, `order` INT, name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_program_substeps (id INT, step_id INT, `order` INT, code STRING, name STRING, start_offset INT, offset INT, model_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_program_values (id INT, production_program_id INT, step_id INT, substep_id INT, `order` INT, code STRING, offset INT, reason STRING, object_id INT) PARTITIONED BY (expected_date DATE, actual_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_programs (id INT, name STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, outline_id INT, party_id INT, employee_id INT, style_number STRING, po_number STRING, item_name STRING, quantity DECIMAL) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_step_products (id INT, step_id INT, product_id INT, type INT, production_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_steps (id INT, production_outline_id INT, `order` INT, name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS production_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS productions (id INT, name STRING, pre_costing_id INT, workorder_id INT, outline_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, status INT, updated_by INT, production_program_id INT) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS products (id INT, item_id INT, name STRING, name_is_generated TINYINT, description STRING, model_id INT, manufacturer_id INT, step_size DECIMAL, mrp DECIMAL, purchase_price DECIMAL, sale_vat DECIMAL, inc_vat DECIMAL, vendor_id INT, wastage_product_id INT, ordered_qty DECIMAL, asset TINYINT, `unique` TINYINT, code STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, barcode STRING, delivery_system INT, `raw` TINYINT, finished TINYINT, unit_of_measurement_id INT, purchase_warranty INT, sale_warranty INT, assembled TINYINT, intermediate TINYINT, inactive TINYINT, deleted TINYINT, sale_discount DECIMAL, purchase_discount DECIMAL, sale_price DECIMAL, purchase_vat DECIMAL, sale_price2 DECIMAL, sale_price3 DECIMAL, warranty_period INT, serial_length INT, serial_generation_system INT, internal_serial_start INT, internal_serial_prefix STRING, product_serial_disable TINYINT, no_of_serials INT, hs_code STRING, sub_category_id INT, carton_capacity DECIMAL, `out` TINYINT, own TINYINT, weight_per_feet DECIMAL, length_feet DECIMAL, weight_per_pcs DECIMAL, product_sale_price_per_pcs DECIMAL, per_kg_gross_price DECIMAL, provision_1 DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, product_outline_id INT, note DECIMAL, distribute_expense TINYINT, chassis STRING, engine STRING, warranty_applicable TINYINT, wastage TINYINT, provision_for_kg DECIMAL, surcharge_amount DECIMAL, default_inventory_id INT, default_shelf_id INT, default_rack_id INT, image_url STRING, tax_1 DECIMAL, tax_2 DECIMAL, tax_3 DECIMAL, miscellaneous_data STRING, product_group_id INT, income_acc_id INT, general_discount_percent DECIMAL, special_discount_percent DECIMAL, alternate_unit_price DECIMAL, tax_4 DECIMAL, cost_tenure INT, min_order_qty INT, max_order_qty INT, movement_tenure INT, expense_acc_id INT, availability_in_so TINYINT, availability_in_po TINYINT, sub_category_2_id INT, sub_category_3_id INT, sub_category_4_id INT, gp DECIMAL, has_sub_product TINYINT, no_promotion TINYINT, no_sales_point TINYINT, tax_5 DECIMAL, tax_6 DECIMAL, tax_7 DECIMAL, tax_8 DECIMAL, asset_serial_length INT, asset_serial_start INT, asset_serial_prefix STRING, asset_depreciation_rate DECIMAL, asset_master_id INT, residual_value DECIMAL, is_dummy TINYINT, grouped TINYINT, non_inventory TINYINT, eligible_for_emi_sale TINYINT, service INT, expiry_duration INT, product_segment_id INT, lead_time INT, branch_id_list STRING, non_rebatable INT, max_rebate_percentage DECIMAL, non_rebatable_impact_accounting INT, vat_included_flag INT, is_app_product INT, sales_force INT, gross_weight_ratio DECIMAL, is_single_variant INT, hide_in_stock INT, is_special INT, vds_acc_id INT, tds_acc_id INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS proforma_invoices (id INT, commission_rate DECIMAL, per_unit TINYINT, partial_shipment INT, container_shipment STRING, port_of_shipment STRING, destination_port STRING, sale_contact_no STRING, shipping_mark STRING, project_id INT) PARTITIONED BY (exp_lc_open_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS proforma_outlines (id INT, name STRING, code STRING, term_1 TINYINT, term_2 TINYINT, term_3 TINYINT, term_4 TINYINT, term_5 TINYINT, term_6 TINYINT, term_7 TINYINT, term_8 TINYINT, term_9 TINYINT, term_10 TINYINT, term_1_text STRING, term_2_text STRING, term_3_text STRING, term_4_text STRING, term_5_text STRING, term_6_text STRING, term_7_text STRING, term_8_text STRING, term_9_text STRING, term_10_text STRING, clause_1 TINYINT, clause_2 TINYINT, clause_3 TINYINT, clause_4 TINYINT, clause_5 TINYINT, clause_6 TINYINT, clause_7 TINYINT, clause_8 TINYINT, clause_9 TINYINT, clause_10 TINYINT, clause_1_text STRING, clause_2_text STRING, clause_3_text STRING, clause_4_text STRING, clause_5_text STRING, clause_6_text STRING, clause_7_text STRING, clause_8_text STRING, clause_9_text STRING, clause_10_text STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, style TINYINT, `order` TINYINT, booking_value TINYINT, raw_materials TINYINT, comm_tamount TINYINT, comm_kg TINYINT, comm_out_amt TINYINT, comm_out_kg TINYINT, party_filter_by_branch TINYINT, carton_info INT, is_import INT, is_export INT, customer_name_label STRING, customer_address_label STRING, lc_total_label STRING, buying_house_name INT, buyer_order_number INT, lc_days INT, e_bin INT, buyer_style_number INT, bank_branch INT, contact_person INT, construction INT, finished_weight INT, color INT, weave INT, width INT, net_weight INT, gross_weight INT, shrinkage_warp INT, shrinkage_weft INT, fob_total_us INT, send_proforma_prefix STRING, send_proforma_code STRING, sappo_no INT, beneficiary_tin_no INT, marketing_person INT, grade INT, order_no INT, product_name INT, last_order_number INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS program_book (id INT, particular_work_type_id INT, branch_id INT, figure INT, unit_of_measurement_id INT, men INT, women INT, casual INT, total INT, employee_1 INT, employee_2 INT, employee_3 INT, remarks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, program_book_number STRING) PARTITIONED BY (creation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS project_employees (id INT, hr_project_id INT, project_id INT, employee_id INT, involvement_ratio DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS project_expenses (id INT, project_id INT, amount DECIMAL, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS project_groups (id INT, name STRING, code STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS project_wise_users (id INT, user_id INT, project_list STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS projects (id INT, name STRING, party_id INT, address_id INT, type INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, amount DECIMAL, updated_by INT, inactive TINYINT, deleted TINYINT, branch_id INT, project_group_id INT, code STRING, latitude DECIMAL, longitude DECIMAL) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotion_customers (id INT, promotion_id INT, customer_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotion_free_products (id INT, promotion_id INT, saleable_sub_category_id INT, saleable_item_id INT, saleable_product_id INT, free_sub_category_id INT, free_item_id INT, free_product_id INT, saleable_product_quantity DECIMAL, free_product_quantity DECIMAL, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, saleable_barcode STRING, saleable_code STRING, free_barcode STRING, free_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotion_outlines (id INT, name STRING, customer TINYINT, category TINYINT, sub_category TINYINT, department TINYINT, sub_department TINYINT, item TINYINT, vendor TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, code STRING, promo_code_prefix STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotion_parties (id INT, promotion_id INT, customer_category_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, membership_card_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotion_products (id INT, promotion_id INT, item_id INT, product_id INT, promotional_price DECIMAL, promotional_discount DECIMAL, promotional_discount_percent DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, promotional_special_discount DECIMAL, promotional_special_discount_percent DECIMAL, promotional_general_discount DECIMAL, promotional_general_discount_percent DECIMAL, branch_id INT, sub_category_id INT, code STRING, barcode STRING, product_sale_discount DECIMAL, product_sale_discount_2 DECIMAL, base_tp DECIMAL, base_sale_price DECIMAL, product_sale_discount_percent DECIMAL, vendor_id INT, min_quantity DECIMAL, max_quantity DECIMAL, is_recurrent DECIMAL, promotional_discount_3_percent DECIMAL, promotional_discount_3 DECIMAL, promotional_discount_4_percent DECIMAL, promotional_discount_4 DECIMAL, promotional_discount_5_percent DECIMAL, promotional_discount_5 DECIMAL, batch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotional_gift_products (id INT, promotional_gift_id INT, product_id INT, quantity DECIMAL, quantity_taken DECIMAL, quantity_remaining DECIMAL, type TINYINT, type_text STRING, sequence STRING, sequence_taken STRING, code STRING, barcode STRING, total DECIMAL, cogs_unit_cost DECIMAL, min_purchase_amount DECIMAL, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotional_gifts (id INT, branch_id INT, customer_category_id INT, status INT, name STRING, code STRING, total DECIMAL, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS promotions (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, promotion_type INT, promo_code STRING, outline_id INT, status INT, applied_branch_id INT, sub_category_id INT, sub_category_2_id INT, sub_category_3_id INT, sub_category_4_id INT, discount_percent DECIMAL, discount DECIMAL, supp_discount_percent DECIMAL, supp_discount DECIMAL, customer_category_id INT, payment_method INT, vendor_promo_applicable_on INT, payment_method_cash INT, payment_method_credit INT, payment_method_cash_and_card INT, payment_method_emi INT, payment_method_card INT, discount_3_percent DECIMAL, discount_3 DECIMAL, discount_4_percent DECIMAL, discount_4 DECIMAL, discount_5_percent DECIMAL, discount_5 DECIMAL, discount_3_applicable_on INT, discount_4_applicable_on INT, discount_5_applicable_on INT, sale_invoice_min_amount DECIMAL, sale_invoice_max_amount DECIMAL) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS provided_services (id INT, name STRING, display_name STRING, service_id STRING, `group` STRING, description STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS purchase_order_outlines (id INT, name STRING, code STRING, product_feature STRING, discount_per_product TINYINT, vendor_address TINYINT, description TINYINT, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, acceptance_date TINYINT, maturity_date TINYINT, lc_payment_term TINYINT, payment_within_days TINYINT, template STRING, vat_per_product TINYINT, vat TINYINT, display_branch_info TINYINT, barcode TINYINT, carton_info TINYINT, item_filtering_by_vendor TINYINT, type_select TINYINT, send_work_order TINYINT, account_payable TINYINT, social_networking_info TINYINT, auto_accept TINYINT, instant_delivery TINYINT, inventory TINYINT, money_exchange_category_id TINYINT, auto_payment TINYINT, auto_mail TINYINT, item_filter TINYINT, product_image TINYINT, party_type TINYINT, fob_date TINYINT, asset_purpose TINYINT, chassis TINYINT, engine TINYINT, save_and_print TINYINT, inactive TINYINT, deleted TINYINT, full_amount_paid TINYINT, show_note TINYINT, purchase_delivery TINYINT, delivery_date TINYINT, vat_account TINYINT, ait TINYINT, ait_account TINYINT, discount TINYINT, multicurrency TINYINT, party_contact_required TINYINT, payment_plan TINYINT, qc TINYINT, terms_condition TINYINT, tax_1 TINYINT, tax_2 TINYINT, tax_3 TINYINT, tax_4 TINYINT, product_movement TINYINT, bulk_product_load TINYINT, page_title STRING, expiry_date TINYINT, purchase_request TINYINT, vendor_email TINYINT, category_filter TINYINT, product_code TINYINT, avg_tp TINYINT, unit_cost_formula INT, rpu_readonly TINYINT, vat_deduction_at_source INT, source_tax_type INT, price_type INT, rebate INT, brokerage INT, branch_id_required INT, instant_delivery_at_approval INT, min_max_qty_check INT, allow_extra_ledgers INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS purchase_orders (id INT, sub_total DECIMAL, src_sub_total DECIMAL, employee_id INT, inventory_id INT, asset TINYINT, purchase_order_outline_id INT, lc_payment_term STRING, payment_within_days STRING, po_id INT, wo_id INT, total_vat DECIMAL, expenses DECIMAL, type_select INT, send_work_order_id INT, auto_accept TINYINT, instant_delivery TINYINT, money_exchange_category_id INT, contra_account_id INT, cash_bank_account_id INT, grand_total DECIMAL, request_id INT, delivery_id INT, vat_percent DECIMAL, vat_account_id INT, ait_percent DECIMAL, total_ait DECIMAL, ait_account_id INT, total_tax DECIMAL, total_reverse_charge DECIMAL, due_amount DECIMAL, delivery_status INT, by_vendor TINYINT, backref INT, vat_deduction_at_source INT, source_tax_percent DECIMAL, total_source_tax DECIMAL, price_type INT, source_tax_type INT, job_request_id INT, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, rebate DECIMAL, vds_type DECIMAL, instant_delivery_at_approval INT, extra_ledgers_amount INT) PARTITIONED BY (payment_date DATE, fob_date DATE, acceptance_date DATE, maturity_date DATE, delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS purchase_request_outlines (id INT, name STRING, code STRING, product_movement TINYINT, bulk_product_load TINYINT, requisition_id TINYINT, asset_purpose TINYINT, request_level TINYINT, department_id TINYINT, stock TINYINT, description_in_grid TINYINT, category_id TINYINT, item_id TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, comments TINYINT, product_code TINYINT, barcode TINYINT, carton_info INT, branch_id_required INT, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 INT, variant_5 INT, variant_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_accept_reject_criteria_groups (id INT, name STRING, code STRING, criteria_type INT, observation_type INT, correction_message_type INT, sample_type INT, sample_size INT, minimum_acceptance_score STRING, defect_score STRING, minimal_defect_score STRING, critical_defect_score STRING, acceptance_ratio_for_defect STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, related_modules STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_accept_reject_criterias (id INT, name STRING, code STRING, criteria_group_id INT, label STRING, product_id INT, variant_1 INT, variant_2 INT, criteria_type INT, observation_type INT, correction_message_type INT, sample_type INT, sample_description STRING, sample_size INT, minimum_acceptance_score STRING, defect_score STRING, minimal_defect_score STRING, critical_defect_score STRING, acceptance_ratio_for_defect STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, unit_of_measurement_id INT, criteria_max_options INT, option_1 STRING, option_2 STRING, option_3 STRING, option_4 STRING, option_5 STRING, option_6 STRING, option_7 STRING, option_8 STRING, option_9 STRING, option_10 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_accept_reject_group_criterias (id INT, name STRING, code STRING, criteria_group_id INT, label STRING, product_id INT, variant_1 INT, variant_2 INT, criteria_type INT, observation_type INT, correction_message_type INT, sample_type INT, sample_description STRING, sample_size INT, minimum_acceptance_score STRING, defect_score STRING, minimal_defect_score STRING, critical_defect_score STRING, acceptance_ratio_for_defect STRING, rank INT, criteria_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_inspections (id INT, qc_number STRING, branch_id INT, product_id INT, qc_template_id INT, entry_time STRING, source_type STRING, source_id INT, prod_run_id INT, prod_proc_step_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_register_criterias (id INT, qc_register_id INT, criteria_id INT, sample_size INT, sample_description STRING, minimum_acceptance_score STRING, defect_score DECIMAL, minimal_defect_score DECIMAL, critical_defect_score DECIMAL, acceptance_ratio_for_defect DECIMAL, correction_message STRING, criteria_group_id INT, score STRING, option_1 STRING, option_2 STRING, option_3 STRING, option_4 STRING, option_5 STRING, option_6 STRING, option_7 STRING, option_8 STRING, option_9 STRING, option_10 STRING, checked INT, boolean_option INT, criteria_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_registers (id INT, qc_number STRING, branch_id INT, product_id INT, qc_template_id INT, entry_time STRING, source_type STRING, source_id INT, prod_run_id INT, prod_proc_step_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, qc_inspection_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_template_criterias (id INT, criteria_id INT, template_id INT, sample_description STRING, sample_value STRING, criteria_type INT, criteria_group_id INT, observation_type INT, correction_message_type INT, sample_type INT, sample_size INT, minimum_acceptance_score STRING, defect_score STRING, minimal_defect_score STRING, critical_defect_score STRING, acceptance_ratio_for_defect STRING, criteria_max_options INT, option_1 STRING, option_2 STRING, option_3 STRING, option_4 STRING, option_5 STRING, option_6 STRING, option_7 STRING, option_8 STRING, option_9 STRING, option_10 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_templates (id INT, name STRING, qc_step_id INT, branch_id INT, related_module STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, product_id INT, qc_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS qm_qc_types (id INT, code STRING, name STRING, related_modules STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS qr_code_gen_mappings (id INT, qr_code STRING, delivery_id INT, variant_1 INT, variant_2 INT, product_batch_id INT, product_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS quotation_outlines (id INT, name STRING, code STRING, term_1 TINYINT, term_2 TINYINT, term_3 TINYINT, term_4 TINYINT, term_5 TINYINT, term_6 TINYINT, term_7 TINYINT, term_8 TINYINT, term_9 TINYINT, term_10 TINYINT, term_1_text STRING, term_2_text STRING, term_3_text STRING, term_4_text STRING, term_5_text STRING, term_6_text STRING, term_7_text STRING, term_8_text STRING, term_9_text STRING, term_10_text STRING, clause_1 TINYINT, clause_2 TINYINT, clause_3 TINYINT, clause_4 TINYINT, clause_5 TINYINT, clause_6 TINYINT, clause_7 TINYINT, clause_8 TINYINT, clause_9 TINYINT, clause_10 TINYINT, clause_1_text STRING, clause_2_text STRING, clause_3_text STRING, clause_4_text STRING, clause_5_text STRING, clause_6_text STRING, clause_7_text STRING, clause_8_text STRING, clause_9_text STRING, clause_10_text STRING, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, total TINYINT, quantity TINYINT, variant_6 TINYINT, style TINYINT, custom_1 TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS quotations (id INT, master_doc_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS quotes_terms_conditions (id INT, commercial_doc_id INT, terms STRING, group_name STRING, header STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS rack_distributions (id INT, product_id INT, delivery_id INT, inventory_id INT, shelf_id INT, rack_id INT, quantity DECIMAL, display_quantity DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS racks (id INT, name STRING, shelf_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rainfall_record (id INT, `time` STRING, rainfall STRING, temperature STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rate_config_slabs (id INT, amount DECIMAL, absent INT, late INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, payscale_data_id INT, leave_value INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS raw_material_issue (id INT, production_planning_id INT, production_id INT, production_step_id INT, workorder_id INT, product_id INT, finished_product_id INT, quantity_issued DECIMAL, quantity_damaged DECIMAL, quantity_rejected DECIMAL, quantity_returned DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS raw_order_items (id INT, order_id INT, product_id INT, type INT, serial STRING, quantity DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, vat DECIMAL, discount_per_product DECIMAL, discount DECIMAL, total DECIMAL, proforma_id INT, src_unit_cost DECIMAL, src_total DECIMAL, custom_field_1 STRING, custom_field_2 STRING, description STRING, project_id INT, feature_sheet STRING, deliverable_quantity DECIMAL, deliverable_amount DECIMAL, warranty INT, src_discount DECIMAL, src_vat DECIMAL, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING, deleted TINYINT, style_id INT, if_product TINYINT, carton_quantity DECIMAL, carton_capacity DECIMAL, po_id INT, wo_id INT, note DECIMAL, total_note_amount DECIMAL, free_product_qty DECIMAL, chassis STRING, engine STRING, promotional_price TINYINT, deadline_price DECIMAL, unit_id INT, tax_1 DECIMAL, tax_2 DECIMAL, tax_3 DECIMAL, mrp DECIMAL, unit_of_measurement_id INT, carton_loose_pcs DECIMAL, general_discount_percent DECIMAL, special_discount_percent DECIMAL, general_discount DECIMAL, special_discount DECIMAL, is_free TINYINT, tax_4 DECIMAL, promotion_id INT, batch_product_price_id INT, product_code STRING, barcode STRING, total_general_discount DECIMAL, total_trade_discount DECIMAL, display_quantity DECIMAL, provision_1 DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, quantity_2 DECIMAL, is_asset TINYINT, trade_discount DECIMAL, entry_order INT, free_product_promotion STRING, promotion_list STRING, product_type STRING, work_order_amount_percent DECIMAL, work_order_id INT, commission DECIMAL, commission_percent DECIMAL, performance_guarantee_percent DECIMAL, performance_guarantee DECIMAL, min_mrp DECIMAL, rebate_percent INT, rebate INT, delivery_id INT, discount_3 DECIMAL, discount_4 DECIMAL, discount_5 DECIMAL, total_discount_3 DECIMAL, total_discount_4 DECIMAL, total_discount_5 DECIMAL, brokerage_percent DECIMAL, brokerage DECIMAL, beam_no STRING, roll_number STRING, quality_code STRING, extra_quality_code STRING, qty_points INT, gross_weight DECIMAL, calculated_actual_weight DECIMAL, width_uom DECIMAL, no_of_pieces DECIMAL, grade STRING, display_gross_weight DECIMAL, display_calculated_actual_weight DECIMAL, vat_included_flag INT, unit_cost_with_vat DECIMAL, ait_percent DECIMAL, sales_uom INT, sales_quantity DECIMAL, additional_charge_id INT, additional_charge_value DECIMAL, additional_charge2_id INT, additional_charge3_id INT, additional_charge4_id INT, additional_charge2_value DECIMAL, additional_charge3_value DECIMAL, additional_charge4_value DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS raw_pos_sale_orders (id INT, data STRING, product_name STRING, customer_name STRING, customer_id STRING, terminal_code STRING, branch_id INT, customer_phone STRING, total_amount DECIMAL, sub_total DECIMAL, vat DECIMAL, discount DECIMAL, adjust_point DECIMAL, adjustment_amount DECIMAL, cash_receive DECIMAL, cash_return DECIMAL, ref_no STRING, sync_so_number STRING, socl_id STRING, status INT, status_code INT, user_name STRING, sync_time TIMESTAMP, created_date TIMESTAMP, updated_date TIMESTAMP, server_msg STRING, inactive TINYINT, deleted TINYINT, created_by INT, updated_by INT, error_message STRING, is_latest_pos INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rebate_tax_slabs (id INT, name STRING, start_value DECIMAL, end_value DECIMAL, rebate_rate DECIMAL, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS recalculate_inventory (id INT, product_id INT, opening_quantity DECIMAL, delivery_in_quantity DECIMAL, delivery_out_quantity DECIMAL, closing_quantity DECIMAL, opening_cost DECIMAL, delivery_in_cost DECIMAL, delivery_out_cost DECIMAL, closing_cost DECIMAL, opening_quantity_kgs DECIMAL, delivery_in_quantity_kgs DECIMAL, delivery_out_quantity_kgs DECIMAL, closing_quantity_kgs DECIMAL, dirty TINYINT, barcode STRING, variant_1 INT, variant_2 INT, variant_3 INT, variant_4 STRING, variant_5 STRING, variant_6 STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS receipt_book_leafs (id INT, receipt_number STRING, receipt_book_id INT, status TINYINT, voucher_id INT, amount DECIMAL, party_id INT, employee_id INT, employee_id2 INT, payment_method INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING) PARTITIONED BY (issue_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS receipt_books (id INT, receipt_book_no STRING, leaf_prefix STRING, branch_id INT, first_receipt_no INT, number_of_leafs INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, user_id INT) PARTITIONED BY (issue_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS receive_proforma_invoices (id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS receive_purchase_requests (id INT, expected_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS receive_quotations (id INT, reference STRING, terms STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS receive_sample_orders (id INT, sample_type INT, placement_status INT, factory_id INT) PARTITIONED BY (factory_date DATE, shipping_date DATE, delivery_date DATE, reject_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS receive_workorders (id INT, delivery_date STRING, payment_method_type STRING, shipping_address_id INT, billing_address_id INT, total_promotional_discount DECIMAL, total_trade_discount DECIMAL, total_general_discount DECIMAL, total_special_discount DECIMAL, special_discount_percent DECIMAL, sub_total DECIMAL, src_discount DECIMAL, coupon_discount DECIMAL, total_discount_3 DECIMAL, total_discount_4 DECIMAL, total_discount_5 DECIMAL, source_port INT, destination_port INT, is_cmt INT, common_sizes STRING, common_colors STRING, common_styles STRING, common_quantity DECIMAL, common_rpu DECIMAL, acceptance_qualtity_level DECIMAL, tna_id INT, latitude DECIMAL, longitude DECIMAL, party_type STRING, sub_type INT, post_latitude DECIMAL, post_longitude DECIMAL) PARTITIONED BY (till_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS ref_voucher_items (id INT, voucher_id INT, number STRING, type INT, payment_method INT, amount DECIMAL, remarks STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, ref_voucher_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS refund (id INT, employee_id INT, payroll_item_id INT, rate DECIMAL, total_amount DECIMAL, paid_amount DECIMAL, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE, paid_upto DATE, refund_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS refund_details (id INT, refund_id INT, employee_id INT, schedule_id INT, payroll_earning_id INT, payroll_payment_id INT, amount DECIMAL, refund_amount DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS refund_histories (id INT, refund_id INT, voucher_id INT, type INT, amount DECIMAL, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, employee_id INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS regions (id INT, name STRING, code STRING, party_id INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS registered_accessories (id INT, machine_id INT, accessory_id INT, product_id INT, registered_machine_id INT, serial_1 STRING, serial_2 STRING, serial_3 STRING, serial_4 STRING, serial_5 STRING, serial_6 STRING, registration_name STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, updated_by TIMESTAMP, status INT, health DECIMAL, vendor_id INT, part_number STRING) PARTITIONED BY (maintenance_start DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS registered_machine_maintenance_frequencies (id INT, name STRING, frequency INT, registered_machine_id INT, maintenance_duration INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (start_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS registered_machineries (id INT, machine_id INT, product_id INT, serial_1 STRING, serial_2 STRING, serial_3 STRING, serial_4 STRING, serial_5 STRING, serial_6 STRING, registration_name STRING, status INT, health DECIMAL, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated INT, updated_by TIMESTAMP, vendor_id INT, part_number STRING, branch_id INT, registration_alias STRING, prod_unit_id INT) PARTITIONED BY (maintenance_start DATE, last_schedule_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS registrations_for_concerns (id INT, registration_id INT, make_of_vehicle STRING, class_of_vehicle STRING, key_no STRING, number_of_cylinder STRING, color_of_vehicle STRING, no_of_tyre_with_size STRING, year_of_mfg STRING, horse_power STRING, laden_weight STRING, wheel_base STRING, seating_capacity STRING, makers_name STRING, unit_price DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS registrations_for_delivery_gate_pass (id INT, registration_id INT, key_no STRING, model_of_vehicle STRING, year_of_mfg STRING, number_of_cylinder STRING, seating_capacity STRING, class_of_vehicle STRING, color_of_vehicle STRING, no_of_tyre_with_size STRING, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS registrations_for_sales_invoice (id INT, registration_id INT, colour STRING, quantity DECIMAL, description STRING, unit_price DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS registrations_of_basic_information (id INT, name STRING, father_name STRING, address STRING, phone_no STRING, nationality STRING, gurdian_name STRING, serial_1 STRING, serial_2 STRING, year_of_mfg STRING, previous_reg_no STRING, p_o_bank STRING, sex INT, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT, branch_id INT) PARTITIONED BY (date_of_birth DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS religions (id INT, name STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS report_download_logs (id INT, title STRING, report_url STRING, search_parameter STRING, file_path STRING, file_ext STRING, file_size STRING, identification_val STRING, unique_identifier STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS report_outlines (id INT, url STRING, name STRING, code STRING, querystring STRING, is_default INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS report_print_count_logs (id INT, identification_val STRING, url STRING, count INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS report_qr_codes (id INT, identification_val STRING, unique_identifier STRING, file_path STRING, report_url STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, request_path STRING, serial STRING, verification_template STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS reports_footer (id INT, branch_id INT, footer_name STRING, file STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, updated_by INT, created_by INT, created TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS reports_header (id INT, branch_id INT, header_name STRING, file STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, updated_by INT, created_by INT, created TIMESTAMP, for_verification INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS requisition_products (id INT, requisition_id INT, product_id INT, quantity_requested DECIMAL, quantity_approved DECIMAL, quantity_delivered DECIMAL, description STRING, feature_sheet STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS requisitions (id INT, department_id INT, description STRING, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, sheet STRING, party_id INT, type INT) PARTITIONED BY (requisition_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS resources (id INT, name STRING, view_func STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS revenue_stamp_slabs (id INT, start_from DECIMAL, end_to DECIMAL, deduction_amount DECIMAL, calculation_type_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_beds (id INT, room_id INT, type INT, code STRING, unit_cost DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_building_floors (id INT, building_id INT, name STRING, code STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_buildings (id INT, name STRING, code STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_guests (id INT, booking_id INT, name STRING, gender INT, age INT, email STRING, mobile STRING, nid STRING, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_room_booking_items (id INT, booking_id INT, room_id INT, bed_id STRING, quantity INT, vat_percent DECIMAL, total_vat DECIMAL, discount_percent DECIMAL, discount DECIMAL, unit_cost DECIMAL, created TIMESTAMP, updated TIMESTAMP, inactive INT, deleted INT) PARTITIONED BY (start_date DATE, end_date DATE, checkout_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_room_bookings (id INT, code STRING, party_id INT, net_total DECIMAL, grand_total DECIMAL, discount_percent DECIMAL, discount DECIMAL, vat_percent DECIMAL, total_vat DECIMAL, paid_amount DECIMAL, due_amount DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, account_id INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_room_facilities (id INT, name STRING, code STRING, description STRING, unit_cost DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rm_rooms (id INT, floor_id INT, product_id INT, building_id INT, name STRING, code STRING, type INT, description STRING, facility_ids STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_chartmaking_details (id INT, chartmaking_id INT, component_id INT, measurement DECIMAL, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_chartmakings (id INT, name STRING, code STRING, sample_request_id INT, style_id INT, size_id INT, template_id INT, weight DECIMAL, gauge DECIMAL, yarn STRING, tension STRING, body STRING, back STRING, rib STRING, cross_point DECIMAL, needle_point DECIMAL, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_color_wise_items (id INT, cutting_item_id INT, color_id INT, size_id INT, cutting_quantity INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_entries (id INT, code STRING, ref_no STRING, style_id INT, buyer_order_id INT, production_order_id INT, season STRING, cut_no STRING, cut_method INT, cut_id STRING, table_no STRING, start_time TIMESTAMP, end_time TIMESTAMP, production_unit_id INT, colors STRING, no_of_piles INT, marker_id INT, total_quantity INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (planned_start_date DATE, planned_end_date DATE, delivery_date DATE, `date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_items (id INT, cutting_id INT, color_id INT, fabric_id INT, cutting_quantity INT, no_of_piles INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_marker_component_info (id INT, marker_id INT, component_id INT, size_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_marker_info (id INT, pattern_id INT, style_id INT, marker_length DECIMAL, marker_length_uom_id INT, marker_width DECIMAL, marker_width_uom_id INT, fabrics_lay_length DECIMAL, fabrics_lay_length_uom_id INT, fabrics_lay_width DECIMAL, fabrics_lay_width_uom_id INT, efficiency DECIMAL, marker_created_by INT, color_list STRING, size_list STRING, status INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_cutting_marker_ration (id INT, marker_id INT, size_id INT, ratio INT, toal INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_item_comp_template_details (id INT, template_id INT, component_id INT, measurement DECIMAL, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_item_comp_templates (id INT, name STRING, code STRING, item_id INT, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_measurement_components (id INT, name STRING, code STRING, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_pattern_marker (id INT, name STRING, style_id INT, template_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_pattern_marker_components (id INT, pattern_id INT, component_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_sample_request_stages (id INT, name STRING, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_sample_request_stages_status (id INT, sample_request_id INT, stage_id INT, remarks STRING, created TIMESTAMP, UPDATEd TIMESTAMP, created_by INT, UPDATEd_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_sample_requests (id INT, order_no STRING, gauge STRING, yearn_composition STRING, accessories STRING, measurement_specification STRING, quantity STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, product_id INT, style_id INT, measurement_chart STRING, swatch STRING, special_instruction STRING, remarks STRING, sample_type_id INT) PARTITIONED BY (submission_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS rmg_type (id INT, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS roles (id INT, built_in INT, name STRING, modules STRING, groups STRING, resources STRING, description STRING, label STRING, background_color STRING, foreground_color STRING, deleted TINYINT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, code STRING, menu STRING, max_days_backdated_entry INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS route_details (id INT, route_id INT, sub_location STRING, pickup_time STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS route_employee_group (id INT, route_id INT, group_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS route_employee_group_details (id INT, route_employee_group_id INT, route_details_id INT, employee_id INT, department_id INT, route_city_id INT, route_thana_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS route_visits (id INT, route_id INT, employee_id INT, code STRING, visit_frequency INT, visit_day INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS routes (id INT, name STRING, from_country_id INT, to_country_id INT, from_division_id INT, to_division_id INT, from_thana_id INT, to_thana_id INT, from_city_id INT, to_city_id INT, from_post_office INT, to_post_office INT, from_post_code INT, to_post_code INT, from_line3 STRING, to_line3 STRING, from_line2 STRING, to_line2 STRING, from_line1 STRING, to_line1 STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS rsa_active_keys (session_key STRING, public_key STRING, private_key STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS salary_cycles (id INT, name STRING, from_day INT, code STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS salary_locations (id INT, code STRING, name STRING, address_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id_list STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_contacts (id INT, commision DECIMAL, booking_amount DECIMAL, customer_id INT, commision_per_unit TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_adjustment_by_voucher (id INT, voucher_id INT, invoice_id INT, incentive_adjustment DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_config_items (id INT, config_id INT, name STRING, type INT, slab_start DECIMAL, slab_end DECIMAL, slab_benefits DECIMAL, slab_type INT, extra_slab_start DECIMAL, extra_slab_benefits DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, within_in_days INT, slab_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_configs (id INT, product_id INT, category_id_1 INT, category_id_2 INT, category_id_3 INT, category_id_4 INT, calculation_on INT, is_progressive INT, customer_category_id INT, incentive_type_id INT, payment_method_id INT, branch_id INT, frequency_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, config_number STRING, incentive_based_on INT, account_id INT, credit_account_id INT, consider_cancellation INT, config_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_item_details (id INT, process_item_id INT, customer_id INT, product_id INT, item_id INT, sale_amount DECIMAL, collection_amount DECIMAL, quantity DECIMAL, calculation_on INT, growth DECIMAL, growth_applicable INT, incentive_amount_rate DECIMAL, calculation_amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_new_configs (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, customer_category_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_process (id INT, product_id INT, category_id_1 INT, category_id_2 INT, category_id_3 INT, category_id_4 INT, calculation_on INT, is_progressive INT, customer_category_id INT, incentive_type_id INT, payment_method_id INT, voucher_branch_id INT, frequency_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, process_number STRING, incentive_based_on INT, voucher_id INT, config_id INT, voucher_done INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_process_items (id INT, process_id INT, customer_id INT, total_sale_amount DECIMAL, total_collection_amount DECIMAL, total_quantity DECIMAL, calculation_on INT, growth DECIMAL, growth_applicable INT, incentive_amount_rate DECIMAL, calculation_amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, net_amount DECIMAL, config_item_id INT, invoice_id INT, incentive_amount DECIMAL, invoice_id_list STRING, slab_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_product_details (id INT, process_item_id INT, customer_id INT, product_id INT, category_id_1 INT, category_id_2 INT, category_id_3 INT, category_id_4 INT, sale_amount DECIMAL, collection_amount DECIMAL, quantity DECIMAL, calculation_on INT, growth DECIMAL, growth_applicable INT, incentive_amount_rate DECIMAL, calculation_amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_segment_details (id INT, process_item_id INT, customer_id INT, product_id INT, category_id_1 INT, category_id_2 INT, category_id_3 INT, category_id_4 INT, product_segment_id INT, sale_amount INT, collection_amount INT, quantity INT, calculation_on INT, growth INT, growth_applicable INT, incentive_amount_rate INT, calculation_amount INT, inactive INT, deleted INT, created INT, updated INT, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_slab_items (id INT, name STRING, type INT, slab_start DECIMAL, slab_end DECIMAL, slab_benefits DECIMAL, slab_type INT, extra_slab_start DECIMAL, extra_slab_benfits DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, within_in_days INT, customer_category_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_incentive_slabs (id INT, `start` DECIMAL, `end` DECIMAL, growth_rate DECIMAL, calculation_type_id INT, amount DECIMAL, config_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_order_mis_info (id INT, financing_type INT, financing_party_id INT, down_payment_amount INT, financing_amount INT, tenure_in_months STRING, old_mcy_model STRING, old_mcy_exchange_price INT, old_mcy_year_model STRING, exchanged_by INT, current_vehicle STRING, tenure_of_usage STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_order_outline_attributes (id INT, name STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_order_outlines (id INT, name STRING, code STRING, product_feature STRING, down_payment TINYINT, vat TINYINT, general_discount INT, special_discount TINYINT, discount_accounting TINYINT, show_customer_previous_balance TINYINT, multicurrency TINYINT, customer_dropdown TINYINT, customer_address TINYINT, party_type TINYINT, reference_number TINYINT, terms TINYINT, instant_delivery TINYINT, show_stock TINYINT, show_booked TINYINT, item_filter TINYINT, warranty TINYINT, sales_person TINYINT, sales_person2 TINYINT, sales_person3 TINYINT, enable_accounts TINYINT, plan TINYINT, barcode TINYINT, delivery_date TINYINT, courier TINYINT, shipping_address TINYINT, auto_accept TINYINT, order_number TINYINT, cogs_account TINYINT, terms_condition TINYINT, manual_transaction TINYINT, delivery TINYINT, voucher TINYINT, clear_grid TINYINT, income_account TINYINT, account_receivable TINYINT, cash_bank_account TINYINT, description TINYINT, prefix STRING, auto_delivery TINYINT, delivery_visible TINYINT, voucher_visible TINYINT, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, style TINYINT, credit_limit TINYINT, payment_method TINYINT, created_by TINYINT, completed_by TINYINT, mrp_check TINYINT, sale_type TINYINT, credit_card_info TINYINT, display_branch_info TINYINT, inventory TINYINT, vat_per_product TINYINT, serial TINYINT, invoice_with_serial TINYINT, invoice_with_serial_2 TINYINT, save_and_print TINYINT, inactive TINYINT, deleted TINYINT, quotation TINYINT, carton_info TINYINT, receive_work_order TINYINT, distribution_price_limit_check TINYINT, commission_calculation TINYINT, vat_after_discount TINYINT, work_order TINYINT, shipment TINYINT, brand TINYINT, sale_delivery_combo TINYINT, reference TINYINT, attention TINYINT, subject TINYINT, social_networking_info TINYINT, auto_mail TINYINT, product_image TINYINT, project TINYINT, credit_period_check TINYINT, cash_due_check TINYINT, fob_date TINYINT, asset_purpose TINYINT, chassis TINYINT, engine TINYINT, show_available TINYINT, full_amount_paid TINYINT, show_note TINYINT, unique_ref_no TINYINT, discount TINYINT, bb_flag TINYINT, credit_period_editable TINYINT, receive_voucher_combo TINYINT, `less` TINYINT, save_and_email TINYINT, party_contact_required TINYINT, unit_cost_formula TINYINT, unit_cost_total_uneditable TINYINT, ait TINYINT, tax_1 TINYINT, tax_2 TINYINT, tax_3 TINYINT, tax_4 TINYINT, socl_adjustment TINYINT, product_code TINYINT, trade_discount INT, gift_coupon TINYINT, category_filter TINYINT, page_title STRING, weight_machine_integration TINYINT, cash INT, credit INT, emi INT, card INT, cash_and_card INT, total_general_discount INT, total_trade_discount INT, unit_cost_editable INT, discount_editable INT, provision_1 INT, provision_2 INT, provision_3 INT, provision_4 INT, provision_5 INT, provision_for_kgs INT, single_order_item TINYINT, category_filter_for_search INT, promotion_list_show INT, show_work_order_quantity INT, tax_1_editable INT, show_qty_sum INT, performance_guarantee INT, commission INT, tax_1_account_id INT, tax_2_account_id INT, tax_3_account_id INT, tax_4_account_id INT, performance_guarantee_account_id INT, commission_account_id INT, tax_1_text STRING, tax_2_text STRING, tax_3_text STRING, tax_4_text STRING, rwo_combo_on_delivery INT, allow_extra_ledgers INT, stock_validation INT, sub_category_filter_for_search TINYINT, manual_override_discount INT, exchange_rate DECIMAL, show_carton_qty_sum TINYINT, man_ref_text INT, delivery_reason INT, market_return_delivery_mandatory INT, discount_3 INT, discount_4 INT, discount_5 INT, qr_code INT, bank_emi INT, financer_mis INT, exchange_vehicle INT, pdc INT, source_of_enquiry INT, vendor_account_info INT, prevent_product_load_from_order INT, online_payment INT, cash_on_delivery INT, mfs INT, show_vat_included_price INT, resale INT, resale_mandatory INT, vat_after_special_discount INT, room_booking INT, carton_info_for_cancellation INT, show_all_account TINYINT, show_discount TINYINT, mr_unit_cost_editable INT, bank_cash_acc_id INT, income_acc_id INT, read_only_wo_in_cancellation INT, instant_delivery_auto_pending_by_stock_check INT, ait_type INT, multiple_product_select INT, vat_calculated_after_ait INT, sales_uom INT, additional_charge INT, delivery_date_filter INT, additional_charge2 INT, additional_charge3 INT, additional_charge4 INT, additional_charge_label STRING, additional_charge2_label STRING, additional_charge3_label STRING, additional_charge4_label STRING, plan_quantity INT, quantity_sum_if_duplicate_product INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_orders (id INT, sub_total DECIMAL, src_sub_total DECIMAL, proforma_id INT, employee_id INT, country_id INT, division_id INT, city_id INT, inventory_id INT, total_vat DECIMAL, grand_total DECIMAL, customer_balance DECIMAL, delivery_status INT, instant_delivery TINYINT, due_amount DECIMAL, plan_id INT, sale_order_outline_id INT, shipment_address STRING, auto_accept TINYINT, cogs_account_id INT, terms STRING, employee_id2 INT, employee_id3 INT, cash_bank_account_id INT, style_id INT, payment_method INT, sale_type INT, card_bank_id INT, card_number STRING, card_type INT, card_device_id INT, quotation_id INT, disable_stock_validation TINYINT, receive_work_order_id INT, vat_percent DECIMAL, wo_id INT, shipment_id INT, reference STRING, attention STRING, subject STRING, `less` DECIMAL, bb_flag INT, credit_period INT, sale_delivery_id INT, model_id INT, customer_category_id INT, referrer_id INT, provision_1 DECIMAL, provision_for_kg DECIMAL, provision_2 DECIMAL, provision_3 DECIMAL, provision_4 DECIMAL, provision_5 DECIMAL, shipping_address STRING, travel_route_id INT, adjusted_balance_amount DECIMAL, total_tax DECIMAL, shipping_gstin STRING, shipping_careof STRING, receive_voucher_id INT, discount_percent DECIMAL, interest_rate DECIMAL, interest_income_account_id INT, ait_percent DECIMAL, total_ait DECIMAL, ait_account_id DECIMAL, shipping_address_id INT, billing_address_id INT, total_promotional_discount DECIMAL, bonus_point DECIMAL, coupon_discount DECIMAL, total_trade_discount DECIMAL, total_general_discount DECIMAL, total_special_discount DECIMAL, special_discount_percent DECIMAL, rounding_adjustment DECIMAL, job_id INT, backref INT, commission DECIMAL, commission_percent DECIMAL, performance_guarantee_percent DECIMAL, performance_guarantee DECIMAL, bill_type INT, commission_formula INT, commodity_id INT, discard_discount INT, delivery_reason_id INT, total_discount_3 DECIMAL, total_discount_4 DECIMAL, total_discount_5 DECIMAL, order_sheet_id INT, plan_quantity INT, incentive_adjustment DECIMAL, bank_emi INT, mis_info_id INT, financial_doc_id INT, source_of_enquiry INT, resale INT, delivery_charge INT, rate_of_exchange DECIMAL, total_installments INT, prev_paid_amount DECIMAL, booking_id INT) PARTITIONED BY (payment_date DATE, fob_date DATE, delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sale_targets (id INT, name STRING, `start` INT, `end` INT, description STRING, created_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_based_basic_salary_config_info (id INT, count_from INT, count_to INT, salary_percentage DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_commission_assignments (id INT, sales_commission_id INT, employee_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_commission_generate_payments (id INT, sales_commission_id INT, employee_id INT, total_commission DECIMAL, voucher_id INT, paid_status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_commission_parties (id INT, sales_commission_id INT, party_id INT, amount DECIMAL, commission DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_commission_products (id INT, sales_commission_id INT, product_id INT, manufacturer_id INT, quantity DECIMAL, value DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_commissions (id INT, name STRING, model INT, type INT, rate INT, payment_option INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, plan_period INT, branch_id INT, target_type INT) PARTITIONED BY (start_date DATE, end_date DATE, last_paid_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_location (id INT, title STRING, layer_id INT, parent_id INT, division_id INT, district_id INT, thana_id INT, union_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_location_details (id INT, sales_location_id INT, employee_id INT, branch_id INT, replacement_employee_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_location_manager (id INT, sales_location_id INT, employee_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_point (id INT, party_id INT, voucher_id INT, referrer_id INT, referral_id INT, type INT, total_point DECIMAL, adjustable_point DECIMAL, cash_back_point DECIMAL, gift_point DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_quota_distribution_levels (id INT, name STRING, level INT, code STRING, parent_id INT, distribution_point_id INT, parent_distribution_point_id INT, distribution_frequency INT, child_distribution_frequency INT, distribution_type INT, distribute_with INT, distribute_with_level_2 INT, parent_distribution_frequency INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, distribution_method INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_quota_distributions (id INT, sales_quota_distribution_level_id INT, level INT, distribution_point_id INT, distribution_point_value_id INT, ref_distribution_point_id INT, ref_distribution_point_id_value INT, ref_distribution_point_level_2_id INT, ref_distribution_point_level_2_value INT, cost_center_id INT, employee_id INT, project_id INT, department_id INT, branch_id INT, product_id INT, item_id INT, amount DECIMAL, revision INT, final_revision INT, year STRING, half INT, terminal INT, quarter INT, month INT, week INT, is_single INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, quantity DECIMAL, query_data INT, based_on INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_stage (id INT, stage_name STRING, probability INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_incentive_slabs (id INT, slab_name STRING, from_rate_percentage DECIMAL, to_rate_percentage DECIMAL, incentive_percentage DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_kpi_wise_incentive_summary (id INT, sales_target_id INT, employee_id INT, form_id INT, kpi_id INT, sales_parameter_type_id INT, rating_system_id INT, points INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (sales_target_end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_location (id INT, sales_target_id INT, sales_location_id INT, amount DECIMAL, parent_id INT, division_id INT, district_id INT, thana_id INT, union_id INT, frequency_parent_id INT, frequency_is_child INT, is_child INT, frequency INT, year INT, month_id INT, name STRING, employee_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_outline (id INT, frequency INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_slabs (id INT, slab_name STRING, from_range DECIMAL, to_range DECIMAL, incentive_amount DECIMAL, models STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_target_summary_updated_info (id INT, sales_target_id INT, updated_at TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_targets (id INT, name STRING, target DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, is_month_end INT, is_kpi_data_processed INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_team_details (id INT, sales_team_id INT, department_id INT, employee_id INT, is_team_lead INT) PARTITIONED BY (start_date DATE, End_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_teams (id INT, title STRING, description STRING, parent_sales_team_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_tier (id INT, sales_location_id INT, layer_id INT, parent_id INT, division_id INT, district_id INT, thana_id INT, union_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_tier_details (id INT, sales_tier_id INT, sales_location_id INT, employee_id INT, layer_id INT, parent_id INT, division_id INT, district_id INT, thana_id INT, union_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sales_tier_employee (id INT, sales_tier_id INT, employee_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sample_deliveries (id INT, order_id INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sample_delivery_products (id INT, delivery_id INT, product_id INT, quantity DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS sample_enquiries (id INT, customer_id INT, status INT, factory_id INT, sample_type INT, active_status INT, currency_id STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, branch_id INT) PARTITIONED BY (enquiry_date DATE, completion_date DATE, factory_date DATE, delivery_date DATE, shipping_date DATE, reject_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sample_enquiry_products (id INT, sample_enquiry_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, feature_sheet STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sample_order_placement_histories (id INT, order_id INT, previous_status INT, current_status INT, created_by INT, created TIMESTAMP) PARTITIONED BY (change_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sb_budget_details (id INT, sb_budget_id INT, sale_person_id INT, item_id INT, product_id INT, budget_amount DECIMAL, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, quantity DECIMAL, territory_type_id INT, territory_area_id INT, month_1 DECIMAL, month_2 DECIMAL, month_3 DECIMAL, month_4 DECIMAL, month_5 DECIMAL, month_6 DECIMAL, month_7 DECIMAL, month_8 DECIMAL, month_9 DECIMAL, month_10 DECIMAL, month_11 DECIMAL, month_12 DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS sb_budgets (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (start_year DATE, end_year DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS schedule_attendance (id INT, employee_id INT, schedule_id INT, working_days DECIMAL, present_days DECIMAL, absent_days DECIMAL, late_absent_days DECIMAL, late_hour DECIMAL, total_hour DECIMAL, working_hour DECIMAL, raw_over_time_hour DECIMAL, raw_extra_over_time_hour DECIMAL, over_time_hour DECIMAL, extra_over_time_hour DECIMAL, leave_count DECIMAL, leave_wop_count DECIMAL, total_leave_deduction_amount DECIMAL, full_present TINYINT, piece INT, total_piecework_amount DECIMAL, over_piece INT, present_in_holiday DECIMAL, piece_work_days INT, no_job_days INT, eot_days INT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT, deleted TINYINT, early_out_hour DECIMAL, present_in_special_holiday INT, weekends INT, wfh_days DECIMAL, holidays_ot_hour DECIMAL, requisition_ot_hour DECIMAL, short_leave DECIMAL, subschedule_id INT, early_out_absent_days DECIMAL, odd_entry_absent_days DECIMAL, actual_absent_days DECIMAL, total_employee_holiday DECIMAL, maternity_leave_days DECIMAL, requisition_ot_hour_two DECIMAL, requisition_ot_hour_four DECIMAL, suspension_days DECIMAL, absent_considering_suspension_days DECIMAL, pms_percentage DECIMAL, sales_based_basic_percentage DECIMAL, sales_incentive_percentage DECIMAL, leave_encashment_amount DECIMAL, sales_count DECIMAL, leave_count_without_el DECIMAL, employee_deposit_amount DECIMAL, employee_sales_force_kpi DECIMAL) PARTITIONED BY (maternity_leave_start DATE, maternity_leave_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS schedule_piecework_summary (id INT, employee_id INT, schedule_id INT, rate_id INT, rate DECIMAL, piece DECIMAL, amount DECIMAL, piece_work_days INT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS schedule_taxable_income (id INT, employee_id INT, schedule_id INT, monthly_amount DECIMAL, yearly_amount DECIMAL, examption DECIMAL, taxable_amount DOUBLE, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS security_deposits (id INT, payment_method INT, cheque_number STRING) PARTITIONED BY (cheque_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS selection_criteria (id INT, label STRING, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_proforma_invoices (id INT, vendor_id INT, indent TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_purchase_requests (id INT, expected_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_quotations (id INT, reference STRING, terms STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_sample_orders (id INT, sample_type INT, placement_status INT, factory_id INT) PARTITIONED BY (factory_date DATE, shipping_date DATE, delivery_date DATE, reject_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_techspecs (id INT, items STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS send_workorders (id INT, delivery_date STRING, payment_method_type STRING, prod_order_id INT, prod_process_id INT, prod_proc_step_id INT, rebate DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_activity_type (id INT, name STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_product_price_changes (id INT, service_contract_product_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, vat DECIMAL, total DECIMAL, discount DECIMAL, created_by INT, updated_by INT) PARTITIONED BY (start_date DATE, bill_starts DATE, end_date DATE, last_billed DATE, next_bill DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_product_specs (id INT, name STRING, contract_product_id INT, group_id INT, label_id INT, has_dropdown INT, dropdown_value STRING, value STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_product_specs_histories (id INT, name STRING, contract_product_id INT, group_id INT, label_id INT, has_dropdown INT, dropdown_value STRING, value STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_products (id INT, service_contract_id INT, service_uid STRING, party_id INT, billingcycle_id INT, cyclewise_billing TINYINT, ondemand_bill INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, discount DECIMAL, vat_percent DECIMAL, vat DECIMAL, total DECIMAL, service_package_id INT, connectivity_status INT, inactive TINYINT, agreement_type INT, outline_id INT, deleted TINYINT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, unit_of_measurement_id INT, branch_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, project_id INT, contact_person_id INT, connection_type INT, connectivity_type INT, allocated_ip STRING) PARTITIONED BY (start_date DATE, bill_starts DATE, end_date DATE, last_billed DATE, second_last_billed DATE, next_bill DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_products_history (id INT, party_id INT, service_contract_id INT, service_package_id INT, service_contract_product_id INT, service_uid STRING, billingcycle_id INT, cyclewise_billing TINYINT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, discount DECIMAL, vat_percent DECIMAL, vat DECIMAL, total DECIMAL, bill_status INT, bill_type INT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, unit_of_measurement_id INT, branch_id INT, deleted TINYINT, project_id INT, type INT, connection_type INT, connectivity_type INT, allocated_ip STRING) PARTITIONED BY (bill_date DATE, due_date DATE, modify_date DATE, start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_request_products (id INT, service_contract_request_id INT, service_uid STRING, party_id INT, billingcycle_id INT, cyclewise_billing TINYINT, ondemand_bill INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, discount DECIMAL, vat_percent DECIMAL, vat DECIMAL, total DECIMAL, service_package_id INT, connectivity_status INT, inactive TINYINT, deleted TINYINT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, unit_of_measurement_id INT, branch_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, project_id INT, connection_type INT, connectivity_type INT, allocated_ip STRING) PARTITIONED BY (start_date DATE, bill_starts DATE, end_date DATE, last_billed DATE, second_last_billed DATE, next_bill DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contract_requests (id INT, name STRING, code STRING, party_id INT, branch_id INT, contract_id INT, service_package_id INT, discount DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, status TINYINT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, ref_survey_response INT, project_id INT, type INT) PARTITIONED BY (start_date DATE, end_date DATE, activation_date DATE, billed_upto DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_contracts (id INT, name STRING, code STRING, party_id INT, branch_id INT, service_package_id INT, discount DECIMAL, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, down_payment DECIMAL, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, ref_survey_response INT, commercial_docs_id INT, project_id INT, type INT) PARTITIONED BY (start_date DATE, end_date DATE, activation_date DATE, billed_upto DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_discontinuation_requests (id INT, product_id INT, party_id INT, service_contract_product_id INT, service_contract_id INT, service_package_id INT, billingcycle_id INT, unit_cost DECIMAL, quantity DECIMAL, unit_of_measurement_id INT, total DECIMAL, adjustment_amount DECIMAL, requested_by INT, approved_by INT, request_status INT, branch_id INT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, accepted_by INT, transaction_id INT, own_approval INT) PARTITIONED BY (apply_date DATE, request_date DATE, approve_date DATE, accepted_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_ledgers (id INT, party_id INT, service_contract_id INT, service_package_id INT, service_contract_product_id INT, billingcycle_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, total DECIMAL, invoice_number STRING) PARTITIONED BY (start_date DATE, end_date DATE, bill_date DATE, due_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_level_agreements (id INT, name STRING, code STRING, contract_id INT, service_contract_product_id INT, employee_id INT, party_id INT, color INT, color_code STRING, first_reply_time INT, resolve_time INT, urgent_reply_time INT, update_time INT, penalty INT, penalty_rate DECIMAL, onsite_training INT, online_training INT, onsite_support INT, online_support INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, parent_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_level_agreements_global (id INT, name STRING, code STRING, color INT, color_code STRING, first_reply_time INT, resolve_time INT, urgent_reply_time INT, update_time INT, penalty INT, penalty_rate DECIMAL, onsite_training INT, online_training INT, onsite_support INT, online_support INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_level_agreements_service_wise (id INT, name STRING, code STRING, color INT, service_id INT, color_code STRING, first_reply_time INT, resolve_time INT, urgent_reply_time INT, update_time INT, penalty INT, penalty_rate DECIMAL, onsite_training INT, online_training INT, onsite_support INT, online_support INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_package_products (id INT, service_package_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, vat DECIMAL, total DECIMAL, billingcycle_id INT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, unit_of_measurement_id INT, flat_discount DECIMAL, percentage_discount DECIMAL, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, price_change_type INT, connection_type INT, connectivity_type INT, allocated_ip STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_packages (id INT, name STRING, description STRING, amount DECIMAL, custom TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, deleted TINYINT, inactive TINYINT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, branch_id INT, duration INT, duration_calculation_type INT, sequence_number INT, total_disc_amount DECIMAL, net_amount DECIMAL) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_products (id INT, warranty_claim_id INT, product_id INT, required_quantity INT, status INT, deleted TINYINT, product_name STRING, received_quantity INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_sale_invoice_info (id INT, info_type INT, description STRING, sequence INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_specification_groups (id INT, name STRING, label STRING, service_id INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_specification_labels (id INT, name STRING, label STRING, service_id INT, group_id INT, has_dropdown INT, value STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_updown_requests (id INT, product_id INT, party_id INT, service_contract_product_id INT, service_contract_id INT, service_package_id INT, billingcycle_id INT, unit_cost DECIMAL, quantity DECIMAL, unit_of_measurement_id INT, total DECIMAL, adjustment_amount DECIMAL, requested_by INT, approved_by INT, request_status INT, branch_id INT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, accepted_by INT, transaction_id INT, own_approval INT, in_progress_by INT, reviewed_by INT, updown_type INT, ref_doc_id INT, expiry_date TIMESTAMP) PARTITIONED BY (apply_date DATE, request_date DATE, approve_date DATE, accepted_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS service_vouchers (id INT, party_id INT, voucher_id INT, parent_id INT, amount DECIMAL, paid_amount DECIMAL, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS set_up_commissions (id INT, designation_id INT, minimum_commission DECIMAL, maximum_commission DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS share_holders (id INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shelfs (id INT, name STRING, inventory_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_allowance_config_info (id INT, shift_id INT, designation INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_info_temporary (id BIGINT, employee_id INT, start_limit TIMESTAMP, end_limit TIMESTAMP) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_rosters (id BIGINT, employee_id INT, shift_schedule_id INT, is_holiday TINYINT, is_swap TINYINT, swap_employee_id INT, application_id INT, prev_shift_schedule_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, shift_rosters_batch_id INT) PARTITIONED BY (work_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_rosters_batch (id INT, code STRING, status INT, col_names STRING, created_by INT, approved_by INT, updated_by INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, copy_employees STRING, type INT, source_employee INT, branch_id INT, designation_id INT, department_id INT, month INT, transaction_id INT, own_approval INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_rosters_batch_details (id INT, employee_id INT, shift_rosters_batch_id INT, shift_schedule_id INT, is_holiday INT, is_swap INT, swap_employee_id INT, application_id INT, prev_shift_schedule_id INT, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive INT, deleted INT) PARTITIONED BY (work_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_schedules (id INT, name STRING, code STRING, late_in_calculation_method INT, deduct_late_in_from_wh TINYINT, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, description STRING, early_in_limit INT, late_out_limit INT, updated_by INT, created TIMESTAMP, slot_sequencing TINYINT, wh_roundup_type INT, wh_quarter_roundup_limit DECIMAL, wh_half_hour_roundup_limit DECIMAL, wh_three_quarter_roundup_limit DECIMAL, wh_full_hour_roundup_limit DECIMAL, wh_skip_over_limit DECIMAL, ot_roundup_type INT, ot_quarter_roundup_limit DECIMAL, ot_half_hour_roundup_limit DECIMAL, ot_three_quarter_roundup_limit DECIMAL, ot_full_hour_roundup_limit DECIMAL, ot_skip_over_limit DECIMAL, eot_roundup_type INT, eot_quarter_roundup_limit DECIMAL, eot_half_hour_roundup_limit DECIMAL, eot_three_quarter_roundup_limit DECIMAL, eot_full_hour_roundup_limit DECIMAL, eot_skip_over_limit DECIMAL, holiday_calculation_method INT, branch_id INT, is_moderate_holiday_calculation_method TINYINT, date_forward_by INT, count_last_working_slot TINYINT, early_out_limit INT, is_night_shift INT, is_tiffin_allowed INT, branch_id_list STRING, is_special_allowance INT, ignore_overlapping_slots INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_slots (id INT, shift_schedule_id INT, day_id INT, `order` INT, start_time STRING, end_time STRING, first_late_in_limit INT, second_late_in_limit INT, type INT, sub_type INT, duration DECIMAL, is_compliance TINYINT, is_paid TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_swaps (id INT, employee_id INT, current_shift_schedule_id INT, swap_shift_schedule_id INT, swap_employee_id INT, recommended_by INT, approved_by INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT) PARTITIONED BY (application_date DATE, work_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shift_week_days (id INT, shift_schedule_id INT, day_id INT, scope_id INT, early_in_limit INT, late_out_limit INT, `start` STRING, `end` STRING, slot_confirmation TINYINT, weekend TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, early_out_limit INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment (id INT, total_containers STRING, container INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_deliveries (id INT, shipment_schedule_id INT, delivery_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_information (id INT, voucher_id INT, commercial_doc_id INT, assort STRING, quantity DECIMAL, amount DECIMAL, destination_port INT, origin_port INT, party_id INT, mms_shipment_id INT) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_items (id INT, shipment_qty DECIMAL, received_qty DECIMAL, qc_passed_qty DECIMAL, qc_failed_qty DECIMAL, excess_qty DECIMAL, missing_qty DECIMAL, passed_processed DECIMAL, failed_processed DECIMAL, excess_processed DECIMAL, missing_processed DECIMAL, missing_amount DECIMAL, qc_rejected_amount DECIMAL, item_id INT) PARTITIONED BY (amount_calculation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_losses (id INT, shipment_id INT, amount DECIMAL, product_wise_costing TINYINT, description STRING) PARTITIONED BY (calculation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_normal_loss_items (id INT, shipment_normal_loss_id INT, item_id INT, product_id INT, description STRING, adjust_qty DECIMAL, src_amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_on_qc_outlines (id INT, name STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, style TINYINT, item TINYINT, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_on_qcs (id INT, ship_no STRING, po_id INT, net_weight DECIMAL, net_weight_uom INT, gross_weight DECIMAL, gross_weight_uom INT, from_branch_id INT, to_branch_id INT, to_inventory_id INT, next_action INT, schedule_no_id INT, qc_passed_qty DECIMAL, qc_failed_qty DECIMAL, access_qty DECIMAL, missing_qty DECIMAL, in_charge INT, cost_challan_no STRING) PARTITIONED BY (cost_delivery_date DATE, cost_receive_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_outlines (id INT, name STRING, code STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, style TINYINT, item TINYINT, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_ports (id INT, name STRING, code STRING, country_id INT, city_id INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_schedule (id INT, pi_id INT, total_containers INT, ci_id INT, no_of_container INT, port_assessment_days INT, shipping_mode INT) PARTITIONED BY (assessment_date DATE, tent_factory_dispatch_date DATE, tent_document_date DATE, tent_document_release_date DATE, tent_landing_date_port DATE, tent_landing_date_wh DATE, tent_assessment_date DATE, tent_shipping_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipment_schedule_histories (id INT, shipment_schedule_id INT, pi_id INT, ci_id INT, total_containers INT, no_of_container INT, port_assessment_days INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (tent_factory_dispatch_date DATE, tent_document_date DATE, tent_shipping_date DATE, tent_document_release_date DATE, tent_landing_date_port DATE, tent_landing_date_wh DATE, tent_assessment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shipments (id INT, ship_no STRING, order_id INT, po_id INT, net_weight DECIMAL, net_weight_uom INT, gross_weight DECIMAL, gross_weight_uom INT, from_branch_id INT, to_branch_id INT, to_inventory_id INT, next_action INT, schedule_no_id INT, qc_passed_qty DECIMAL, qc_failed_qty DECIMAL, excess_qty DECIMAL, missing_qty DECIMAL, in_charge INT, cost_challan_no STRING, qc_challan_no STRING, status INT, from_inventory_id INT, wo_id INT) PARTITIONED BY (cost_delivery_date DATE, cost_receive_date DATE, qc_receive_date DATE, qc_delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS shortcuts (id INT, binding_key STRING, scope STRING, shortcut_in STRING, redirect_to STRING, description STRING, built_in TINYINT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS signatory_persons (id INT, heading STRING, name STRING, designation STRING, footer STRING, attachment STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS slat_ranges (id INT, slat_id INT, start_height DECIMAL, end_height DECIMAL, box_width DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS slats (id INT, name STRING, size DECIMAL, description STRING, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS sms_apis (id INT, name STRING, username STRING, password STRING, sender STRING, url STRING, method STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sms_templates (id INT, name STRING, class_name STRING, receiver_template STRING, message_template STRING, outline STRING, event STRING, enabled TINYINT, priority INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT, deleted TINYINT, type INT, category INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS smss (id INT, table_name STRING, table_key INT, source STRING, receiver STRING, message STRING, event STRING, priority INT, template_id INT, status STRING, status_msg STRING, error_msg STRING, request_time TIMESTAMP, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS special_allowance_requisition (id INT, employee_id INT, requisition_type INT, amount DECIMAL, status INT, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, hour INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization (id INT, name STRING, department_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization_categories (id INT, name STRING, type_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization_items (id INT, name STRING, unit_id INT, category_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization_terms (id INT, name STRING, item_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization_types (id INT, name STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS specialization_unit_of_measurements (id INT, name STRING, symbol STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, status TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS state_codes (id INT, state_id INT, code STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS stationery_assignment_items (id INT, parent_doc_id INT, employee_id INT, department_id INT) PARTITIONED BY (expiry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS stationery_ledgers (id INT, order_id INT, commercial_doc_id INT, employee_id INT, department_id INT, branch_id INT, product_id INT, quantity DECIMAL, expiry_date TIMESTAMP, inactive INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, transfer_type INT, transfer_from INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS status_histories (id INT, table_name STRING, table_key INT, previous_status INT, current_status INT, ip STRING, created_by INT, created TIMESTAMP) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS stm_employee_own_target (id INT, employee_id INT, organogram_id INT, product_id INT, item_id INT, branch_id INT, department_id INT, cost_center_id INT, year STRING, half INT, terminal INT, quarter INT, month INT, week INT, amount DECIMAL, revision INT, final_revision INT, status INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_applications (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_categories (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_cost_types (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_order_wise_tna_events (id INT, days INT, buffer INT, event_id INT, tna_template_id INT, style_id INT, style_order_id INT, predecessor_id INT, execution_order INT, status INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT, algo_type INT, complete_percent DECIMAL) PARTITIONED BY (start_date DATE, end_date DATE, end_date_with_buffer DATE, complete_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_outline (id INT, name STRING, code STRING, style_code_no INT, fabric_weight INT, construction INT, weave INT, width INT, cuttable_width INT, composition INT, shrinkage_warp INT, shrinkage_weft INT, hs_code INT, gross_weight INT, net_weight INT, remarks INT, inactive INT, deleted INT, created INT, updated INT, created_by INT, updated_by INT, otn INT, ref_style_no INT, designer INT, technical_designer INT, order_no INT, brand INT, buyer INT, smv INT, category INT, style_type INT, `application` INT, season INT, merchant INT, size_range INT, gender INT, merchandiser INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_products (id INT, style_id INT, product_id INT, quantity DECIMAL, description STRING, variant_1 INT, variant_2 INT, variant_3 INT, if_product TINYINT, variant_4 INT, variant_5 INT, variant_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_qualities (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_raw_materials (id INT, style_id INT, product_id INT, quantity DECIMAL, description STRING, variant_1 INT, variant_2 INT, variant_3 INT, if_product TINYINT, tolerance DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_section_products (id INT, style_section_id INT, item_id INT, product_id INT, quantity DECIMAL, tolerance DECIMAL, cost_breakdown_ratio DECIMAL, type STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_sections (id INT, style_id INT, section_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS style_types (id INT, name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS styles (id INT, name STRING, buyer_name STRING, merchandiser_name STRING, order_number STRING, inactive TINYINT, deleted TINYINT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS styles_v2 (id INT, number STRING, description STRING, quantity DECIMAL, importer_id INT, exporter_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, name STRING, item_id INT, product_id INT, ref_style_no STRING, designer STRING, technical_file STRING, attachment STRING, technical_designer STRING, order_no STRING, smv DECIMAL, season INT, size_range STRING, buyer_id INT, merchant_id INT, gender INT, merchandiser_id INT, branch_id INT, project_id INT, category_id INT, cost_type_id INT, type_id INT, application_id INT, locked INT, style_code_no STRING, fabric_weight STRING, construction STRING, weave STRING, width STRING, cuttable_width DECIMAL, composition STRING, shrinkage_warp DECIMAL, shrinkage_weft DECIMAL, hs_code STRING, gross_weight DECIMAL, net_weight DECIMAL, remarks STRING, manufacturer_id INT, fabric_description STRING, fabric_type_code STRING) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sub_categories (id INT, name STRING, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, parent_id INT, depth INT, code STRING, movement_tenure INT, cost_tenure INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sub_contract_companies (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS sub_contract_types (id INT, name STRING, code STRING, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS submission_wise_employee_tax (id INT, employee_id INT, submission_id INT, tax_amount DECIMAL, deleted INT, inactive INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey (id INT, title STRING, topic STRING, type INT, target_party STRING, estimated_outcome DECIMAL, budget DECIMAL, campaign_id INT, survey_lead_id INT, assigned_to INT, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, description STRING, survey_number STRING, project_id INT, model_type INT, training_requisition_id INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_basics (id INT, survey_number STRING, title STRING, description STRING, survey_type STRING, project_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, parent_survey_basic_id INT, survey_stage INT, template_for STRING) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_forms (id INT, survey_basic_id INT, survey_question_id INT, question_response STRING, submission_time TIMESTAMP, submitted_by_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_options (id INT, type INT, option STRING, narration STRING, attachment STRING, survey_question_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_queries (id INT, title STRING, description STRING, question_options STRING, question_type INT, question_group_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, serial_no INT, display_serial STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_question_groups (id INT, title STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_questions (id INT, question_type INT, question STRING, narration STRING, attachment STRING, survey_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_responsed_answers (id INT, survey_responsed_question_id INT, answer STRING, survey_options_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_responsed_questions (id INT, survey_response_id INT, question_id INT, question_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS survey_responses (id INT, party_id INT, survey_submit_date TIMESTAMP, survey_id INT, survey_rating INT, remarks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, issue_type INT, issue INT, ref_survey_response INT, response_survey_number STRING, model_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS suspensions (id INT, employee_id INT, reason STRING, deleted INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS sync_histories (id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, table_name STRING, last_synced TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS sync_logs (id INT, type STRING, table_name STRING, row_count STRING, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, description STRING, log_msg STRING, status TINYINT, state TINYINT, created TIMESTAMP, created_by STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS sync_post_history (id INT, ref_no STRING, key STRING, type INT, data STRING, last_sync_date TIMESTAMP, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, status INT, state INT, server_msg STRING, description STRING, created TIMESTAMP, created_by STRING, inactive TINYINT, deleted TINYINT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS table_key_mappers (id INT, name STRING, table_key_id INT, type STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_add_outlines (id INT, name STRING, code STRING, task_name INT, goal_id INT, branch_id INT, start_time INT, end_time INT, assigned_to INT, supervisor_id INT, duration INT, duration_unit INT, is_milestone INT, is_recurrent INT, is_estimated INT, priority INT, description INT, parent_id INT, type INT, category_1 INT, category_2 INT, category_3 INT, category_4 INT, source_type INT, source_id INT, team_id INT, project_id INT, reviewer_id INT, delivery_deadline INT, task_complexity_level INT, attachment INT, customer_id INT, is_goal_mandatory INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_assignee (id INT, task_id INT, assigned_to_type INT, assigned_to INT, status INT, effort_time INT, extra_effort_time INT) PARTITIONED BY (assigning_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_assignment_details (id INT, task_id INT, task_assignment_id INT, note STRING, assignment_number STRING, start_time STRING, end_time STRING, duration STRING, status INT, cost INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_assignments (id INT, assigned_to INT, supervised_by INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) PARTITIONED BY (assigning_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_categories (id INT, name STRING, print_as STRING, code STRING, type INT, depth INT, description STRING, parent_id INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_category_outlines (id INT, name STRING, number_of_category INT, category1_label STRING, category2_label STRING, category3_label STRING, category4_label STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_conversations (id INT, task_id INT, conversation STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_execution_logs (id INT, task_id INT, start_time TIMESTAMP, end_time TIMESTAMP, dt DECIMAL, employee_id INT, working_status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_goal_change_logs (id INT, task_id INT, prev_goal_id INT, curr_goal_id INT, created_by INT, start_date TIMESTAMP, end_date TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_list_outlines (id INT, name STRING, code STRING, column_code INT, column_name INT, column_status INT, column_status_text INT, column_task_status_logs INT, column_task_type_text INT, column_priority INT, column_priority_order INT, column_delivery_deadline INT, column_goal INT, column_assigned_to INT, column_start_time INT, column_end_time INT, column_duration INT, column_duration_unit INT, column_effort_time INT, column_extra_effort_time INT, column_actual_start_time INT, column_actual_end_time INT, column_team_text INT, column_supervisor INT, column_reviewer INT, column_parent_task INT, column_description INT, column_note_edit INT, column_source_type INT, column_source_name INT, column_project_name INT, column_customer_name INT, column_assigned_to_edit INT, column_delete_action INT, column_branch INT, column_created INT, column_created_by_name INT, search_filter_task_category_1 INT, search_filter_task_category_2 INT, search_filter_task_category_3 INT, search_filter_task_category_4 INT, search_filter_code INT, search_filter_type INT, search_filter_name INT, search_filter_priority INT, search_filter_branch_id INT, search_filter_source_type INT, search_filter_source_id INT, search_filter_project_id INT, search_filter_customer_id INT, search_filter_parent_id INT, search_filter_status INT, search_filter_is_assigned INT, search_filter_team_id INT, search_filter_supervisor_id INT, search_filter_assigned_to INT, search_filter_goal_id INT, search_filter_task_filter_by_date_option INT, search_filter_from_date INT, search_filter_to_date INT, search_filter_department_level_1 INT, search_filter_department_level_2 INT, search_filter_department_level_3 INT, search_filter_department_level_4 INT, search_filter_department_level_5 INT, search_filter_department_level_6 INT, column_priority_order_editable INT, grid_grouping_by_assignee INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_manager_resources (id INT, name STRING, rate DECIMAL, rate_unit INT, overtime_rate DECIMAL, units INT, deleted INT, inactive INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_push_messages (id INT, message_body STRING, created_by INT, created TIMESTAMP, post_time TIMESTAMP, response STRING, is_posted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_reviews (id INT, supervisor_id INT, task_id INT, assignee_id INT, rating_id INT, remarks STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_scheduler_template_lists (id INT, name STRING, content STRING, source_id INT, source_type STRING, start_date TIMESTAMP, end_date TIMESTAMP, inactive INT, deleted INT, created TIMESTAMP, created_by INT, UPDATEd TIMESTAMP, UPDATEd_by INT, type INT, duration INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_scheduler_templates (id INT, name STRING, content STRING, dependencies STRING, source_id INT, source_type STRING, start_date TIMESTAMP, end_date TIMESTAMP, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_sources (id INT, task_id INT, source_type STRING, source_id INT, is_primary INT, goal_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_status_change_logs (id INT, task_id INT, `user` STRING, previous_status INT, updated_status INT, status_updated_time TIMESTAMP, duration DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_successors (id INT, task_id INT, parent_id INT, from_side STRING, to_side STRING, type INT, lag INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_types (id INT, name STRING, code STRING, label STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT, related_source STRING, available_departments STRING, is_auto_dt INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_work_duration_histories (id INT, task_id INT, employee_id INT, duration DECIMAL, entry_date TIMESTAMP, remarks STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, parent_child_map STRING, working_status INT, end_time TIMESTAMP, input_channel INT, completion_percentage DECIMAL, ignore_in_overlap_calc INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS task_work_entries (id INT, task_id INT, start_time STRING, end_time STRING, effort_time DECIMAL, assigned_to INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tasks (id INT, name STRING, goal_id INT, description STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, inactive TINYINT, deleted TINYINT, start_time TIMESTAMP, end_time TIMESTAMP, delivery_deadline TIMESTAMP, estimated_done_time STRING, assigned_to STRING, supervisor_id INT, duration DECIMAL, duration_unit INT, duration_seconds INT, code STRING, branch_id INT, is_recurrent INT, is_milestone INT, is_estimated INT, effort_time INT, extra_effort_time INT, status INT, priority INT, priority_order INT, parent_id INT, level INT, color STRING, `order` INT, is_special_event INT, constraint_type STRING, constraint_date TIMESTAMP, locked INT, percent_done DECIMAL, type INT, actual_start_time TIMESTAMP, actual_end_time TIMESTAMP, is_group INT, is_backlog INT, source_type STRING, source_id INT, project_id INT, customer_id INT, reviewer_id INT, is_assigned INT, team_id INT, category_1 INT, category_2 INT, category_3 INT, category_4 INT, is_parent INT, task_complexity_level INT, parent_child_map STRING, parent_task_code STRING, task_add_outline_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tax_opening_balances (id INT, employee_id INT, amount DECIMAL, `date` INT, inactive INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tax_rule_details (id INT, rule_id INT, income_range DECIMAL, rate_in_percent DECIMAL, `order` INT, inactive TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tax_rules (id INT, gender INT, age_from DECIMAL, age_to DECIMAL, disabled INT, country_id INT, maximum_rate DECIMAL, minimum_tax DECIMAL, version INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS taxes (id INT, name STRING, gst_type INT, registration_no STRING, fill_frequency INT, rate DECIMAL, description STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, account_id INT) PARTITIONED BY (start_from DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tea_employee_task (id INT, task_management_id INT, task_type_id INT, employee_id INT, work_amount INT, planned_work_amount INT, unit_of_measurement_id INT, entry_time STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, status INT, rate DECIMAL, piece_rate_id INT, piecework_id INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tea_task_management (id INT, program_book_id INT, task_type_id INT, branch_id INT, target_total INT, unit_of_measurement_id INT, planned_resource INT, contractor INT, total INT, resource INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, rate DECIMAL) PARTITIONED BY (creation_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS team_assignments (id INT, model_name STRING, model_key INT, team_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT, team_list STRING) PARTITIONED BY (effective_from DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS team_members (id INT, team_id INT, team_member_type STRING, party_id INT, team_member_name STRING, team_role_id INT, team_role STRING, engagement_percentage INT, supervisor_id INT, manager_id INT, branch_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (effective_from DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS team_types (id INT, name STRING, related_modules STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS teams (id INT, name STRING, team_type_id INT, branch_id INT, team_lead_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) PARTITIONED BY (effective_from DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_account_balances (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_account_balances_version_two (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_account_orders (id INT, account_id INT, account_number STRING, `order` INT, depth INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_cached_account_balances (id INT, account_id INT, amount DECIMAL, account_amount DECIMAL, party_amount DECIMAL, dirty TINYINT, branch_id INT) PARTITIONED BY (balance_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_cost_center_wise_account_balances (id INT, cost_center_id INT, account_id INT, amount DECIMAL, debit_amount DECIMAL, credit_amount DECIMAL, account_amount DECIMAL) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_salary_batch_increment (id INT, employee_id STRING, current_payscale_id STRING, current_grade_id STRING, payscale_id STRING, payscale_grade_id STRING, current_payscale_amount STRING, amount STRING, effective_date STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS temp_salary_batch_promotion (id INT, employee_id STRING, current_payscale_id STRING, current_grade_id STRING, payscale_id STRING, payscale_grade_id STRING, designation_id STRING, department_id STRING, current_payscale_amount STRING, amount STRING, effective_date STRING, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS terms_and_condition (id INT, name STRING, code STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS terms_and_condition_details (id INT, tc_id INT, title STRING, detail_1 STRING, detail_2 STRING, extra_field_1 STRING, extra_field_2 STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, deleted_by INT, inactive INT, deleted INT, `order` INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS terms_and_condition_individual_entry_details (id INT, title STRING, detail STRING, ref_id INT, `order` INT, created INT, updated INT, created_by INT, deleted_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS third_party_websites (id INT, name STRING, site_url STRING, `application` STRING, branch_id INT, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_assignee_histories (id INT, ticket_id INT, assigned_to_id INT, assigned_by_id INT, assigned_by_user_id INT, assignment_type INT, start_time TIMESTAMP, end_time TIMESTAMP, prev_remarks STRING, changed_remarks STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_conversations (id INT, sender STRING, sent_by INT, ticket_id INT, message STRING, message_id STRING, created_by INT, created TIMESTAMP, posted TINYINT, posted_at TIMESTAMP, in_transaction TINYINT, thread_id STRING, cc STRING, bcc STRING, is_internal INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_level_agents (id INT, ticket_level_id INT, employee_id INT, email STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_levels (id INT, name STRING, group_email STRING, level_type INT, description STRING, inactive TINYINT, branch_id INT, department_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_outline_levels (id INT, ticket_outline_id INT, ticket_level_id INT, `order` INT, max_wait INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_outlines (id INT, name STRING, code STRING, prefix STRING, subtype INT, description STRING, inactive TINYINT, deleted TINYINT, print_as STRING, email_address STRING, email_password STRING, is_email_synchronization INT, mailer_config INT, auto_response_template INT, reply_template INT, last_sync_time TIMESTAMP, assigned_template INT, status_template INT, group_template INT, spam_trigger_words STRING, resolve_template INT, branch_id INT, imap_host STRING, imap_port INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_problems (id INT, name STRING, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, description STRING, service_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_sources (id INT, name STRING, is_system_generated INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS ticket_templates (id INT, type INT, subject STRING, message STRING, inactive TINYINT, deleted TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tickets (id INT, ticket_number STRING, thread_id STRING, requester STRING, subject STRING, description STRING, assignee INT, assigned_to INT, status INT, module_id INT, ticket_type INT, subtype INT, outline_id INT, ref_ticket_id INT, priority INT, branch_id INT, support_seen TINYINT, seen_list STRING, unseen_list STRING, resolve_date TIMESTAMP, updated_by INT, updated TIMESTAMP, requested_by INT, created TIMESTAMP, created_by INT, requested_at TIMESTAMP, inactive TINYINT, deleted TINYINT, outline_level_id INT, last_replied_by INT, last_reply_time TIMESTAMP, estimated_resolve_time STRING, project_id INT, source_id INT, remarks STRING, problem_id_list STRING, module_id_list STRING) PARTITIONED BY (estimated_resolve_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tiffin_bill_config_info (id INT, shift_id INT, hour INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tm_employee_mapper_edit_logs (id INT, organogram_id INT, party_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, supervisor_id INT, field_officer INT, edited_by INT, edited_at TIMESTAMP, previous_data STRING, updated_data STRING) PARTITIONED BY (start_date DATE, end_date DATE, effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tm_territory_areas (id INT, name STRING, print_as STRING, depth INT, organogram_type_id INT, country_id INT, division_list STRING, city_list STRING, thana_list STRING, parent_id INT, employee_designation STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tm_territory_employee_mappers (id INT, organogram_id INT, party_id INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, supervisor_id INT, field_officer INT) PARTITIONED BY (start_date DATE, end_date DATE, effective_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tm_territory_setups (id INT, name STRING, print_as STRING, parent_id INT, depth INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, designation STRING, last_organogram INT, last_organogram_designation STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS tna_event_date_change_logs (id INT, style_order_id INT, style_order_wise_tna_event_id INT, event_id INT, tna_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT, curr_days INT, curr_buffer INT, prev_days INT, prev_buffer INT, prev_status INT, curr_status INT, prev_complete_percent DECIMAL, curr_complete_percent DECIMAL, permission INT, algo_type INT, option INT, remarks STRING) PARTITIONED BY (prev_start_date DATE, curr_start_date DATE, prev_end_date DATE, curr_end_date DATE, prev_end_date_with_buffer DATE, curr_end_date_with_buffer DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS tna_events (id INT, name STRING, days INT, buffer INT, parent_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT, is_customer_tna INT, is_critical INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tna_template_wise_events (id INT, tna_template_id INT, event_id INT, days INT, buffer INT, predecessor_id INT, status INT, execution_order INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tna_templates (id INT, name STRING, duration INT, type_id INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS todolists (id INT, status INT, priority INT, public_private INT, category_id INT, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS tokens (id INT, auth_key STRING, type INT, table_name STRING, table_key INT, user_id INT, visited TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS trainee_attendances (id INT, trainee_id INT, training_schedule_id INT, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS trainees (id INT, employee_id INT, training_requisition_detail_id INT, training_schedule_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS trainers (id INT, name STRING, trainer_type INT, employee_id INT, training_organization_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_accounts (id INT, voucher_id INT, training_voucher_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_budget_details (id INT, training_budget_id INT, training_material_id INT, cost DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_budgets (id INT, training_schedule_id INT, name STRING, total_cost DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_evaluation_details (id INT, training_evaluations_id INT, marks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_evaluations (id INT, name STRING, marking_type INT, min STRING, max STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_ledgers (id INT, training_voucher_id INT, training_material_id INT, account_id INT, amount DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_materials (id INT, name STRING, rate STRING, material_multiplier INT, account_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_organizations (id INT, name STRING, contact_person STRING, contact_designation STRING, phone_number STRING, alt_phone STRING, address STRING, created TIMESTAMP, updated TIMESTAMP, created_by STRING, updated_by STRING, inactive TINYINT, deleted TINYINT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_records (id INT, trainee_id INT, marks STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_requisition_details (id INT, training_requisition_id INT, employee_id INT, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, employee_name STRING, status_text STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_requisitions (id INT, name STRING, training_schedule_id INT, department_id INT, status INT, recommended_by INT, approved_by INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, own_approval INT, transaction_id INT, training_requisition_number STRING, branch_id INT, training_id INT) PARTITIONED BY (requisition_date DATE, recommend_date DATE, approve_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_schedule_assignment_details (id INT, training_schedule_assignments_id INT, requisition_id INT, employee_id INT, status INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_schedule_assignments (id INT, schedule_id INT, branch_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_schedule_details (id INT, training_schedule_id INT, trainer_id INT, venue_id INT, `start` STRING, `end` STRING, session_info STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, session_link STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_schedules (id INT, name STRING, training_id INT, code STRING, description STRING, duration STRING, training_type INT, training_category INT, status INT, training_organization_id INT, max_no_trainee STRING, actual_no_trainee STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_surveys (id INT, survey_id INT, inactive INT, deleted INT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, training_schedule_id INT, employee_access_list STRING, role INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS training_vouchers (id INT, name STRING, training_schedule_id INT, account_id INT, amount DECIMAL, status INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) PARTITIONED BY (voucher_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS trainings (id INT, name STRING, code STRING, description STRING, training_evaluations_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS transfer_orders (id INT, order_id INT) PARTITIONED BY (shipment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_cargo_charges (id INT, party_id INT, master_airway_bill DECIMAL, house_airway_bill DECIMAL, scanning_sub_charge DECIMAL, terminal_handling_charge DECIMAL, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, exchange_rate DECIMAL, cargo_charge_type_id INT, party_type STRING, amount DECIMAL, calculation_policy STRING, code STRING, from_slab INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_cargo_charges_types (id INT, name STRING, charge_calculation_method INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated_by INT, updated TIMESTAMP, priority INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_cargo_flat_charge_slabs (id INT, product_id INT, start_weight DECIMAL, end_weight DECIMAL, amount DECIMAL, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_cargo_order_charges (id INT, product_id INT, total_charge_amount DECIMAL, total_charge_bdt DECIMAL, exchange_rate DECIMAL, order_item_id INT, created TIMESTAMP, updated TIMESTAMP, revenue INT, gross_weight DECIMAL, chargeable_weight DECIMAL, total_vat_bdt DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_cargo_order_charges_items (id INT, travel_cargo_charge_id INT, travel_cargo_order_charge_id INT, party_id INT, gross_weight DECIMAL, chargeable_weight DECIMAL, applicable_weight DECIMAL, default_charge_rate DECIMAL, applied_charge_rate DECIMAL, total_charge DECIMAL, charge_variance DECIMAL, exchange_rate DECIMAL, calculation_policy STRING, vat DECIMAL, vat_percent DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_raw_order_items (id INT, order_id INT, product_id INT, quantity DECIMAL, unit_cost DECIMAL, mawb DECIMAL, hawb DECIMAL, thc DECIMAL, ssc DECIMAL, total DECIMAL, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, exchange_rate DECIMAL, gross_weight DECIMAL, freight DECIMAL, edi DECIMAL, myc DECIMAL, gross_freight DECIMAL, thc_total DECIMAL, ssc_total DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_roi_sc (id INT, travel_roi_id INT, code STRING, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_route_service_charges (id INT, route_id INT, service_charge_id INT, amount DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_routes (id INT, name STRING, index INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS travel_service_charges (id INT, name STRING, label STRING, vendor_id INT, payable_account_id INT, expense_account_id INT, amount_type INT, amount DECIMAL, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, code STRING, based_on STRING, `order` INT, is_vat INT, exclude_ait INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS unit_multipliers (id INT, unit_of_mesaurement_id INT, multiplier_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS units_of_measurement (id INT, name STRING, symbol STRING, format STRING, type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS universities (id INT, full_name STRING, code STRING, country INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS upload_batch (id STRING, upload_configs_id INT, filename STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS upload_configs (id STRING, key STRING, config STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS upload_drafts (id STRING, is_valid TINYINT, original_data STRING, transformed_data STRING, errors STRING, errors_xl STRING, upload_batch_id STRING, ref_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS upload_products (id INT, is_valid INT, error_code STRING, errors STRING, item_text STRING, name STRING, ordered_qty STRING, purchase_price STRING, step_size STRING, code STRING, barcode STRING, unit_of_measurement_text STRING, alternate_unit_price STRING, availability_in_po STRING, availability_in_so STRING, cost_tenure STRING, delivery_system STRING, description STRING, expense_acc_text STRING, finished STRING, gp STRING, image_url STRING, income_acc_text STRING, length_feet STRING, manufacturer_text STRING, max_order_qty STRING, min_order_qty STRING, model_text STRING, movement_tenure STRING, mrp STRING, per_kg_gross_price STRING, product_sale_price_per_pcs STRING, provision_1 STRING, provision_2 STRING, provision_3 STRING, provision_4 STRING, provision_5 STRING, `raw` STRING, sale_price STRING, sub_category_2_text STRING, sub_category_3_text STRING, sub_category_4_text STRING, sub_category_text STRING, vendor_text STRING, weight_per_feet STRING, weight_per_pcs STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS url_response (id INT, name STRING, url STRING, parent_name STRING, type_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_otp_session (username STRING, verification_code STRING, expire_in TIMESTAMP, session_key STRING, session_validity TIMESTAMP, is_verified TINYINT) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_preferences (id INT, `user` INT, `column` STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_secret (id INT, username STRING, secret STRING, email STRING, number STRING, otp_status TINYINT, user_id INT, name STRING, access_code INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_trusted_devices (id INT, username STRING, browser_fingerprint STRING, trusted_till TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_wise_dept_accesses (id INT, user_id INT, department_level_1 INT, department_level_2 INT, department_level_3 INT, department_level_4 INT, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, branch_id INT, department_level_5 INT, department_level_6 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_wise_voucher_type_access_details (id INT, user_role_id INT, voucher_type INT, delivery_type INT, feature_sheet STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, min_amount INT, max_amount INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS user_wise_voucher_types (id INT, user_role_id INT, voucher_type_list STRING, delivery_type_list STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS users (id INT, profile_id INT, username STRING, password STRING, salt STRING, roles STRING, denied STRING, ip_address STRING, inactive TINYINT, deleted TINYINT, user_type INT, branch_id INT, branch_set STRING, partial_view TINYINT, start_time STRING, end_time STRING, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, only_own_data TINYINT, menu STRING, schema STRING, additional_branches STRING, number_of_unauthorized_attempt INT, blocked INT, bookmarks STRING, default_branch_id INT, view_restricted_payroll_data TINYINT, report_admin INT, all_branch INT, authenticate_re_print INT, only_own_customer_data INT, authorized_status_approver INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS vacancy (id INT, vacancy_number STRING, job_type INT, designation_id INT, department_id INT, branch_id INT, priority INT, jobs_id INT, vacancy_assessment_outline_id INT, job_requisition_id INT, job_requisition_details_id INT, quantity INT, location STRING, status INT) PARTITIONED BY (start_date DATE, end_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS vacancy_assessment_outline (id INT, title STRING, pointing_method INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS vacancy_assessment_outline_details (id INT, vacancy_assessment_outline_id INT, step_name STRING, weightage DECIMAL, full_marks DECIMAL) STORED AS ORC

CREATE TABLE IF NOT EXISTS variant_values (id INT, variant_id INT, name STRING, label STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, updated_by INT, item_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS variants (id INT, name STRING, label STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, updated_by INT, item_id INT, is_mandatory_for_code INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS variants_gen_code_mappings (id INT, variant_1_id INT, variant_2_id INT, gen_code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS vendor_categories (id INT, type_name STRING, party_type STRING, index INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS vendors (id INT, status INT, category INT, assign_to INT, vendor_category_id INT, item_id INT) PARTITIONED BY (from_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS venues (id INT, name STRING, capacity STRING, contact_person STRING, contact_designation STRING, phone_number STRING, alt_phone STRING, rent_per_day STRING, address STRING, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, branch_id INT, is_online INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS version_migrations (id INT, old_version STRING, new_version STRING, table_name STRING, column_names STRING, old_data STRING, migrated_data STRING, status INT, data_id INT, error STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS vessel_loadings (id INT, deliveries STRING, driver_name STRING, vehicle_no STRING, dispatch_from STRING, destination_to STRING, contact_no STRING, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, inactive TINYINT) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_appointment_confirmor (id INT, employee_id INT, designated_confirmor_id INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) PARTITIONED BY (`start` DATE, `end` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_appointment_requests (id INT, visitor_id INT, employee_name STRING, employee_department STRING, employee_designation STRING, room_no STRING, employee_id INT, start_time STRING, duration INT, end_time STRING, status INT, purpose_id INT, purpose_description STRING, approved_by INT, confirmed_by INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, appointment_id INT) PARTITIONED BY (appointment_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_appointments (id INT, code STRING, visitor_id INT, employee_id INT, `start` STRING, `end` STRING, duration INT, status INT, approved_by INT, confirmed_by INT, appointment_request_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, purpose_id INT, purpose_description STRING, visit_room_no STRING) PARTITIONED BY (`date` DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_cards (id INT, card_no STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_employees (id INT, name STRING, designation STRING, department STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, blocked INT, username STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_issued_cards (id INT, appointment_id INT, card_id INT, issued_at TIMESTAMP, returned_at TIMESTAMP, status INT, barcode STRING, visitor_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_purposes (id INT, name STRING, code STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS vms_visitors (id INT, name STRING, email STRING, phone STRING, password STRING, otp STRING, otp_expires_at TIMESTAMP, is_verified TINYINT, verification_code STRING, organization STRING, designation STRING, address STRING, nid STRING, photo STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, expires_at TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_outlines (id INT, name STRING, code STRING, pattern STRING, prefix STRING, voucher_type TINYINT, accounts_types STRING, contra_accounts_types STRING, account_ids STRING, contra_account_ids STRING, order_voucher INT, multi_cheque INT, project INT, cost_center INT, account_transaction_type INT, cheque_book INT, cheque_type INT, multi_party INT, multi_project INT, multi_cost_center INT, ref_voucher INT, expense_purpose INT, multi_expense_purpose INT, payment_method_type INT, default_payment_method INT, default_party_type INT, multi_party_type INT, account_id_type INT, bank_info INT, card_payment INT, collection_person INT, multi_collection_person INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, ref_doc INT, cheque INT, total_budget INT, total_remaining_amount INT, total_distributed_budget INT, total_remaining_distributed_amount INT, adjust_tax INT, multi_branch INT, single_account_multi_ledger INT, ref_invoice_combo_format STRING, budget_item INT, total_budget_expense INT, budget_quick_view INT, cheque_assign_after_approval INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_posting_configs (id INT, voucher_type INT, url STRING, auth_url STRING, auth_api_login_url STRING, step INT, header STRING, credential STRING, data_config STRING, return_data_config STRING, response_config STRING, success_action STRING, auth_response_config STRING, login_response_config STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_posting_histories (id INT, config_id INT, voucher_id INT, voucher_type INT, url STRING, data STRING, return_data STRING, status_code STRING, bkash_payment_method STRING, inactive TINYINT, deleted TINYINT, updated TIMESTAMP, created_by INT, created TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_products (id INT, voucher_id INT, product_id INT, product_name STRING, service_contract_id INT, quantity DECIMAL, unit_cost DECIMAL, vat_percent DECIMAL, discount_per_product DECIMAL, total DECIMAL, description STRING, feature_sheet STRING, warranty INT, project_id INT, tax_1 DECIMAL, tax_2 DECIMAL, tax_3 DECIMAL, party_id INT, tax_4 DECIMAL, barcode STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_relations (id INT, external_table_name STRING, external_table_id INT, voucher_id INT, voucher_type INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS voucher_verifications (id INT, voucher_id INT, role STRING, created TIMESTAMP, verified_by STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS vouchers (id INT, ref_number STRING, description STRING, sheet STRING, payment_method_type INT, type INT, amount DECIMAL, account_id INT, contra_account_id INT, party_id INT, cogs DECIMAL, discount DECIMAL, src_discount DECIMAL, status INT, has_transaction TINYINT, src_currency STRING, exchange_rate DECIMAL, src_amount DECIMAL, fluctuation DECIMAL, project_id INT, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, subtype INT, completed_by INT, completed_time TIMESTAMP, `_down_payment` DECIMAL, total_installments INT, total_due DECIMAL, margin_amount DECIMAL, charge_amount DECIMAL, installment_amount DECIMAL, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, serial_number INT, branch_id INT, party_currency STRING, party_amount DECIMAL, version INT, inactive TINYINT, deleted TINYINT, party_type STRING, party_address STRING, party_name STRING, `_voucher_number` STRING, party_contact STRING, expense_purpose INT, asset_purpose INT, external_table STRING, ref_voucher_number STRING, contra_branch_id INT, in_transaction TINYINT, ref_voucher_id INT, calculated_commission DECIMAL, account_cc_id INT, contra_account_cc_id INT, cost_center_id INT, one_time_party_email STRING, sales_point DECIMAL, employee_id INT, employee_id2 INT, employee_id3 INT, receipt_book_id INT, receipt_book_leaf_id INT, gst_rate DECIMAL, gst_transaction_type STRING, hs_code STRING, approved_by INT, `_edit_url` STRING, custom_field_6 STRING, custom_field_7 STRING, custom_field_8 STRING, custom_field_9 STRING, custom_field_10 STRING, adjustment_amount DECIMAL, additional_discount_percent DECIMAL, emi_increase DECIMAL, emi_increased_sub_total DECIMAL, total_interest_amount DECIMAL, total_price_for_emi DECIMAL, emi_principle_amount DECIMAL, system_generated INT, back_ref STRING, custom_field_11 INT, third_party_reference STRING, custom_field_12 STRING, back_ref_number STRING, ref_bank_id INT, ref_bank_account_number STRING, ref_bank_branch_name STRING, ref_bank_account_name STRING, custom_field_13 STRING, outline_id INT, doc_id INT, transaction_id STRING, own_approval INT, market_return_purpose_id INT, man_ref_text STRING, ref_doc_id INT, rebate_amount DECIMAL, hire_sales_code STRING, workflow_transaction_id INT, tm_org_map_text STRING, tm_emp_map_text STRING, tm_organogram_data STRING, budget_id INT, deposite_charge DECIMAL) PARTITIONED BY (voucher_date DATE, maturity_date DATE, deposit_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS waiting_employees (id INT, code STRING, vacancy_id INT, source_id INT, status INT, current_designation STRING, current_company STRING, current_salary DECIMAL, expected_salary DECIMAL, custom_field_1 STRING, custom_field_2 STRING, custom_field_3 STRING, custom_field_4 STRING, custom_field_5 STRING, custom_field_6 STRING, custom_field_7 STRING, custom_field_8 STRING, custom_field_9 STRING, custom_field_10 STRING, note STRING, provision_period INT, appraisal_duration INT, holiday_policy_id INT, leave_policy_id INT, shift_schedule_id INT, payscale_id INT, schedule_id INT, salary_amount DECIMAL, manager_1 INT, manager_2 INT, employee_id INT, employment_type INT, confirmed_salary DECIMAL, marks_obtained DECIMAL, grade_id INT, user_id INT, fingerprint_1 STRING, fingerprint_2 STRING, tracking_number STRING, birth_certificate_number STRING, fingerprint_1_length STRING, fingerprint_2_length STRING, device_code STRING, type INT, has_worked_already INT, image_url STRING, first_name STRING, last_name STRING, middle_name STRING, full_name STRING, print_as STRING, title INT, nick STRING, suffix STRING, gender INT, marital_status INT, comment STRING, passport STRING, national_id STRING, phone STRING, alt_phone STRING, email STRING, alt_email STRING, mobile STRING, alt_mobile STRING, fax STRING, website STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, subtype INT, role INT, parent_id INT, updated_by INT, opening_balance DECIMAL, journal_id INT, branch_id INT, barcode STRING, pin_number STRING, currency STRING, inactive TINYINT, deleted TINYINT, late_fee_policy_id INT, religion STRING, religion_id INT, nationality STRING, father_name STRING, mother_name STRING, spouse STRING, no_of_children INT, height STRING, weight STRING, blood_group STRING, credit_limit DECIMAL, credit_limit_check TINYINT, credit_days INT, blocked TINYINT, skype STRING, phone_prefix STRING, whatsapp STRING, facebook STRING, party_group_id INT, credit_days_check TINYINT, gstin STRING, shipping_gstin STRING, shipping_careof STRING, miscellaneous_data STRING, meter_id INT, meter_number STRING, bin STRING, etin STRING, service_package_id INT, service_contract_id INT, current_employment_status INT, application_id INT, application_code STRING, present_address_line1 STRING, present_address_line2 STRING, present_address_line3 STRING, present_address_city_id INT, present_address_country_id INT, present_address_post_code INT, present_address_thana_id INT, present_address_area_id INT, present_address_post_office INT, present_address_division_id INT, permanent_address_line1 STRING, permanent_address_line2 STRING, permanent_address_line3 STRING, permanent_address_city_id INT, permanent_address_country_id INT, permanent_address_post_code INT, permanent_address_thana_id INT, permanent_address_area_id INT, permanent_address_post_office INT, permanent_address_division_id INT, is_posted INT, qualifications STRING, transfer_approval INT, vacancy_posting_type INT, position_id INT, employee_transfer_id INT) PARTITIONED BY (application_date DATE, next_appraisal_date DATE, `start` DATE, confirmation_date DATE, employee_start DATE, recruitment_date DATE, birthday DATE, entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warning_letters (id INT, employee_id INT, crm_sales_target_id INT, subject STRING, description STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_claims (id INT, party_id INT, party_address STRING, party_name STRING, party_contact STRING, product_id INT, product_serial_no STRING, serial_2 STRING, serial_3 STRING, serial_4 STRING, serial_5 STRING, product_serial_prefix STRING, product_serial_suffix STRING, status INT, type STRING, warranty_claim_number STRING, description STRING, order_no STRING, delivery_no STRING, challan_no STRING, damaged_inventory_delivery STRING, replace_challan_no STRING, replaced_product_id INT, replace_serial_no STRING, replace_serial_2 STRING, replace_serial_3 STRING, replace_serial_4 STRING, replace_serial_5 STRING, parts_received_challan_no STRING, delivery_branch_id INT, branch_id INT, received_by_id INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT, completed_time TIMESTAMP, completed_by INT, claim_for INT, additional_receive STRING, assigned_to INT, sales_status_verdict INT, verdict INT, service_status_verdict INT, problems STRING, service_point_status INT, sales_center_status INT, assigned_branch INT, sc_assigned_branch INT, sc_assigned_to INT, sc_status_description STRING, service_center_status INT, quick_time_status INT, service_center_status_description STRING, sales_center_status_description STRING, service_center_assigned_branch INT, sales_center_assigned_branch INT, service_center_assigned_employee INT, sales_center_assigned_employee INT, source_branch INT, dest_branch INT, accepted_by_dest_branch TINYINT, problem_detail STRING, third_party_name STRING, third_party_contact STRING, third_party_address STRING, ref_order_no STRING, ref_delivery_no STRING, ref_party_id INT, ref_party_name STRING, ref_party_contact STRING, ref_party_address STRING, supplier_status INT, supplier_status_verdict INT, is_group_claim INT, parent_claim_id INT, last_status_id INT, job_for STRING, fleet_id INT, claim_time STRING, expected_delivery_time STRING, delivery_time STRING, is_satisfied TINYINT, dissatisfaction_reasons STRING, satisfaction_level INT, customer_voices STRING, customer_voice_detail STRING, is_waiting TINYINT, quantity DECIMAL, mileage DECIMAL, spare_product_id INT, branch_name STRING, ref_warranty_claim_number STRING, is_posted INT, branch_code STRING, actual_branch_id INT, data_source STRING, is_gvs_module_on INT, service_package_id INT) PARTITIONED BY (claim_date DATE, warranty_end_date DATE, notification_date DATE, replaced_warranty_end_date DATE, set_status_date DATE, sc_status_date DATE, service_center_status_date DATE, sales_center_status_date DATE, supplier_status_date DATE, expected_delivery_date DATE, delivery_date DATE, sale_date DATE, factory_delivery_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_claims_status (id INT, description STRING, status INT, verdict INT, status_type INT, sales_center_branch INT, service_center_branch INT, warranty_claim_id INT, reference_claim_no STRING, assigned_to INT, inactive TINYINT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_claims_toc (id INT, description STRING, sequence INT, inactive TINYINT, deleted TINYINT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_confirmation_batches (id INT, party_id INT, other_party_id INT, product_id INT, serial STRING, code STRING, ref_voucher_no INT, ref_doc_number INT, status INT, inactive INT, deleted INT, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) PARTITIONED BY (entry_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_confirmation_details (id INT, product_id INT, order_no STRING, delivery_no STRING, serial STRING, serials STRING, sl_prefix STRING, sl_start BIGINT, sl_end BIGINT, sl_suffix STRING, sl_count BIGINT, sl_length BIGINT, serial_1 STRING, serial_2 STRING, serial_3 STRING, serial_4 STRING, serial_5 STRING, file_id INT, lot_number STRING, reference_number STRING, div_no INT, warranty_period INT, status INT, deleted TINYINT, inactive TINYINT, file TINYINT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP, delivery_ref_number STRING, description STRING, branch_id INT, inventory_id INT, is_transfer TINYINT, delivery_type INT) PARTITIONED BY (entry_date DATE, expiry_date DATE, warranty_start DATE, warranty_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_products (id INT, warranty_claim_id INT, order_item_id INT, serial_number STRING, description STRING, quantity DECIMAL, solution_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_solutions (id INT, warranty_claim_id INT, warranty_product_id INT, status INT, description STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, solution_voucher_id INT, original_serial STRING, replacement_serial STRING, replacement_inventory_id INT) PARTITIONED BY (solution_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS warranty_survey_mappings (id INT, warranty_id INT, survey_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS welfare_fund_purposes (id INT, name STRING, description STRING, inactive INT, deleted INT, created_by INT, updated_by INT, created TIMESTAMP, updated TIMESTAMP) STORED AS ORC

CREATE TABLE IF NOT EXISTS welfare_funds (id INT, fund_number STRING, employee_id INT, applied_amount DECIMAL, verified_amount DECIMAL, approved_amount DECIMAL, incidence_reason INT, status INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, description STRING) PARTITIONED BY (entry_date DATE, incidence_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_delegation_subordinates (id INT, work_delegation_id INT, employee_id INT, manager_1 INT, manager_2 INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_delegation_wf_approval_layer_temp (id INT, work_delegation_id INT, wf_approval_layer_temp_id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_delegation_wf_approval_layers (id INT, work_delegation_id INT, wf_approval_layer_id INT, employee_id INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_delegations (id INT, employee_id INT, task_description STRING, requested_at TIMESTAMP, accepted_at TIMESTAMP, completed_at TIMESTAMP, accepted_by INT, status INT, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, code STRING, delegator_id INT) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_from_home (id INT, employee_id INT, code STRING, application_type INT, status INT, total_days INT, comment STRING, approved_by INT, recommend_by INT, created TIMESTAMP, updated TIMESTAMP, inactive INT, deleted INT, attachment_id INT, start_time STRING, end_time STRING, time_duration STRING) PARTITIONED BY (from_date DATE, to_date DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_order_outlines (id INT, name STRING, code STRING, style TINYINT, variant_1 TINYINT, variant_2 TINYINT, variant_3 TINYINT, variant_4 TINYINT, variant_5 TINYINT, variant_6 TINYINT, raw_materials TINYINT, importer TINYINT, exporter TINYINT, importer_text STRING, exporter_text STRING, order_no TINYINT, currency TINYINT, hs_code TINYINT, party_address TINYINT, shipping_address TINYINT, party_phone TINYINT, party_email TINYINT, party_contact TINYINT, sales_person TINYINT, brand TINYINT, product_quantity TINYINT, reference TINYINT, attention TINYINT, subject TINYINT, term_1 TINYINT, term_2 TINYINT, term_3 TINYINT, term_4 TINYINT, term_5 TINYINT, term_1_text STRING, term_2_text STRING, term_3_text STRING, term_4_text STRING, term_5_text STRING, order_number_autogenerate TINYINT, chassis TINYINT, product_category TINYINT, product_code TINYINT, show_stock TINYINT, duplicate_product TINYINT, prefix STRING, ref_work_order TINYINT, save_and_print TINYINT, product_movement TINYINT, bulk_product_load TINYINT, description_in_grid TINYINT, quotes_purpose_in_grid TINYINT, item_id TINYINT, category_id TINYINT, ref_party_id TINYINT, expected_date TINYINT, party_label STRING, page_title STRING, terms_and_conditions TINYINT, expiry_date TINYINT, purchase_request TINYINT, barcode TINYINT, requisition_quantity TINYINT, min_order_quantity TINYINT, max_order_quantity TINYINT, avg_tp TINYINT, inventory_id TINYINT, inventory_label STRING, additional_discount TINYINT, general_discount INT, trade_discount INT, total_general_discount INT, total_trade_discount INT, promotion_list_show INT, gift_coupon INT, special_discount INT, `less` INT, tax_1 INT, tax_2 INT, tax_3 INT, tax_4 INT, unit_cost_editable INT, discount_editable INT, carton_info INT, quotation INT, requisition_no INT, tax_1_editable INT, buyer_label STRING, crm_quotation INT, category_filter_for_search INT, payment_type INT, order_purpose INT, multicurrency INT, price_type INT, rebate INT, vds_type INT, discount_3 INT, discount_4 INT, discount_5 INT, brokerage INT, show_booked TINYINT, show_available TINYINT, custom_manual_discount INT, ait INT, branch_id_required INT, cost_center_required INT, party_type INT, additional_charge INT, additional_charge2 INT, additional_charge3 INT, additional_charge4 INT, additional_charge_label STRING, additional_charge2_label STRING, additional_charge3_label STRING, additional_charge4_label STRING, sales_uom INT, quantity_sum_if_duplicate_product INT, delivery_terms INT, payment_terms INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS work_process (id INT, name STRING, description STRING, created TIMESTAMP, created_by INT, updated TIMESTAMP, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_approval_layers (id INT, label STRING, employee_id INT, workflow_config_id INT, designation_id INT, role STRING, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, `order` INT, exception_rules STRING, sla INT, group_id INT, position_id INT, under_delegation INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_approval_layers_temp (id INT, model STRING, model_key INT, employee_id INT, transaction_id INT, approval_level_id INT, accept_url STRING, reject_url STRING, view_url STRING, action STRING, view_column STRING, valid_from TIMESTAMP, valid_to TIMESTAMP, inactive TINYINT, deleted TINYINT, created_by INT, created TIMESTAMP, updated_by INT, updated TIMESTAMP, branch_id INT, requested_by STRING, under_delegation INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_approver_group_employees (id INT, approver_group_id INT, employee_branch_id INT, employee_id INT, employee_name STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_approver_groups (id INT, name STRING, code STRING, branch_id INT, description STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_configs (id INT, model STRING, event STRING, level_id INT, `order` INT, designation STRING, employee_list STRING, exception_rules STRING, inactive INT, deleted INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, level_label STRING, name STRING, branch_id INT, type INT, subtype INT, module STRING, tag_employees INT, workflow_type INT) PARTITIONED BY (effective_date_start DATE, effective_date_end DATE) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_employees (id INT, workflow_config_id INT, employee_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_levels (id INT, model STRING, event STRING, name STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_models (id INT, workflow_config_id INT, model STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, model_name STRING, type INT, type_name STRING, module STRING, module_name STRING) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_positions (id INT, workflow_config_id INT, designation_level_id INT, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS workflow_transactions (id INT, model STRING, event STRING, level INT, model_key INT, triggered_by INT, action STRING, created TIMESTAMP, updated TIMESTAMP, created_by INT, updated_by INT, inactive INT, deleted INT, next_level INT, next_event STRING, level_label STRING, next_level_label STRING, next_employee_id INT, status INT, description STRING, dirty INT, branch_id INT, next_employee_id_list STRING, approved_by INT, rejected_by INT) STORED AS ORC

CREATE TABLE IF NOT EXISTS year_closing (id INT, description STRING, status INT, journal_id INT, created TIMESTAMP, created_by INT, total_income DECIMAL, total_expense DECIMAL, retained_earnings DECIMAL) PARTITIONED BY (closing_date DATE, closing_start DATE) STORED AS ORC