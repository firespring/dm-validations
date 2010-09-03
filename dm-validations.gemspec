# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-validations}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Guy van den Berg"]
  s.date = %q{2010-09-03}
  s.description = %q{Library for performing validations on DM models and pure Ruby object}
  s.email = %q{vandenberg.guy [a] gmail [d] com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "dm-validations.gemspec",
     "lib/dm-validations.rb",
     "lib/dm-validations/auto_validate.rb",
     "lib/dm-validations/contextual_validators.rb",
     "lib/dm-validations/exceptions.rb",
     "lib/dm-validations/formats/email.rb",
     "lib/dm-validations/formats/url.rb",
     "lib/dm-validations/support/context.rb",
     "lib/dm-validations/support/object.rb",
     "lib/dm-validations/validation_errors.rb",
     "lib/dm-validations/validators/absent_field_validator.rb",
     "lib/dm-validations/validators/acceptance_validator.rb",
     "lib/dm-validations/validators/block_validator.rb",
     "lib/dm-validations/validators/confirmation_validator.rb",
     "lib/dm-validations/validators/format_validator.rb",
     "lib/dm-validations/validators/generic_validator.rb",
     "lib/dm-validations/validators/length_validator.rb",
     "lib/dm-validations/validators/method_validator.rb",
     "lib/dm-validations/validators/numeric_validator.rb",
     "lib/dm-validations/validators/primitive_validator.rb",
     "lib/dm-validations/validators/required_field_validator.rb",
     "lib/dm-validations/validators/uniqueness_validator.rb",
     "lib/dm-validations/validators/within_validator.rb",
     "spec/fixtures/barcode.rb",
     "spec/fixtures/basketball_court.rb",
     "spec/fixtures/basketball_player.rb",
     "spec/fixtures/beta_tester_account.rb",
     "spec/fixtures/bill_of_landing.rb",
     "spec/fixtures/boat_dock.rb",
     "spec/fixtures/city.rb",
     "spec/fixtures/company.rb",
     "spec/fixtures/corporate_world.rb",
     "spec/fixtures/country.rb",
     "spec/fixtures/ethernet_frame.rb",
     "spec/fixtures/event.rb",
     "spec/fixtures/g3_concert.rb",
     "spec/fixtures/jabberwock.rb",
     "spec/fixtures/kayak.rb",
     "spec/fixtures/lernean_hydra.rb",
     "spec/fixtures/mathematical_function.rb",
     "spec/fixtures/memory_object.rb",
     "spec/fixtures/mittelschnauzer.rb",
     "spec/fixtures/motor_launch.rb",
     "spec/fixtures/multibyte.rb",
     "spec/fixtures/page.rb",
     "spec/fixtures/phone_number.rb",
     "spec/fixtures/pirogue.rb",
     "spec/fixtures/programming_language.rb",
     "spec/fixtures/reservation.rb",
     "spec/fixtures/scm_operation.rb",
     "spec/fixtures/sms_message.rb",
     "spec/fixtures/udp_packet.rb",
     "spec/integration/absent_field_validator/absent_field_validator_spec.rb",
     "spec/integration/absent_field_validator/spec_helper.rb",
     "spec/integration/acceptance_validator/acceptance_validator_spec.rb",
     "spec/integration/acceptance_validator/spec_helper.rb",
     "spec/integration/automatic_validation/custom_messages_for_inferred_validation_spec.rb",
     "spec/integration/automatic_validation/disabling_inferred_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_boolean_properties_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_float_property_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_format_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_integer_properties_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_length_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_presence_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_primitive_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_within_validation_spec.rb",
     "spec/integration/automatic_validation/spec_helper.rb",
     "spec/integration/block_validator/block_validator_spec.rb",
     "spec/integration/block_validator/spec_helper.rb",
     "spec/integration/conditional_validation/if_condition_spec.rb",
     "spec/integration/conditional_validation/spec_helper.rb",
     "spec/integration/confirmation_validator/confirmation_validator_spec.rb",
     "spec/integration/confirmation_validator/spec_helper.rb",
     "spec/integration/datamapper_models/association_validation_spec.rb",
     "spec/integration/datamapper_models/inheritance_spec.rb",
     "spec/integration/duplicated_validations/duplicated_validations_spec.rb",
     "spec/integration/duplicated_validations/spec_helper.rb",
     "spec/integration/format_validator/email_format_validator_spec.rb",
     "spec/integration/format_validator/format_validator_spec.rb",
     "spec/integration/format_validator/regexp_validator_spec.rb",
     "spec/integration/format_validator/spec_helper.rb",
     "spec/integration/format_validator/url_format_validator_spec.rb",
     "spec/integration/length_validator/default_value_spec.rb",
     "spec/integration/length_validator/equality_spec.rb",
     "spec/integration/length_validator/error_message_spec.rb",
     "spec/integration/length_validator/maximum_spec.rb",
     "spec/integration/length_validator/minimum_spec.rb",
     "spec/integration/length_validator/range_spec.rb",
     "spec/integration/length_validator/spec_helper.rb",
     "spec/integration/method_validator/method_validator_spec.rb",
     "spec/integration/method_validator/spec_helper.rb",
     "spec/integration/numeric_validator/equality_with_float_type_spec.rb",
     "spec/integration/numeric_validator/equality_with_integer_type_spec.rb",
     "spec/integration/numeric_validator/float_type_spec.rb",
     "spec/integration/numeric_validator/gt_with_float_type_spec.rb",
     "spec/integration/numeric_validator/gte_with_float_type_spec.rb",
     "spec/integration/numeric_validator/integer_only_true_spec.rb",
     "spec/integration/numeric_validator/integer_type_spec.rb",
     "spec/integration/numeric_validator/lt_with_float_type_spec.rb",
     "spec/integration/numeric_validator/lte_with_float_type_spec.rb",
     "spec/integration/numeric_validator/spec_helper.rb",
     "spec/integration/primitive_validator/primitive_validator_spec.rb",
     "spec/integration/primitive_validator/spec_helper.rb",
     "spec/integration/pure_ruby_objects/plain_old_ruby_object_validation_spec.rb",
     "spec/integration/required_field_validator/association_spec.rb",
     "spec/integration/required_field_validator/boolean_type_value_spec.rb",
     "spec/integration/required_field_validator/date_type_value_spec.rb",
     "spec/integration/required_field_validator/datetime_type_value_spec.rb",
     "spec/integration/required_field_validator/float_type_value_spec.rb",
     "spec/integration/required_field_validator/integer_type_value_spec.rb",
     "spec/integration/required_field_validator/plain_old_ruby_object_spec.rb",
     "spec/integration/required_field_validator/shared_examples.rb",
     "spec/integration/required_field_validator/spec_helper.rb",
     "spec/integration/required_field_validator/string_type_value_spec.rb",
     "spec/integration/required_field_validator/text_type_value_spec.rb",
     "spec/integration/shared/default_validation_context.rb",
     "spec/integration/shared/valid_and_invalid_model.rb",
     "spec/integration/uniqueness_validator/spec_helper.rb",
     "spec/integration/uniqueness_validator/uniqueness_validator_spec.rb",
     "spec/integration/within_validator/spec_helper.rb",
     "spec/integration/within_validator/within_validator_spec.rb",
     "spec/public/resource_spec.rb",
     "spec/rcov.opts",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unit/contextual_validators/emptiness_spec.rb",
     "spec/unit/contextual_validators/execution_spec.rb",
     "spec/unit/contextual_validators/spec_helper.rb",
     "spec/unit/generic_validator/equality_operator_spec.rb",
     "spec/unit/validation_errors/adding_spec.rb",
     "spec/unit/validation_errors/emptiness_spec.rb",
     "spec/unit/validation_errors/enumerable_spec.rb",
     "spec/unit/validation_errors/reading_spec.rb",
     "tasks/ci.rake",
     "tasks/local_gemfile.rake",
     "tasks/metrics.rake",
     "tasks/spec.rake",
     "tasks/yard.rake",
     "tasks/yardstick.rake"
  ]
  s.homepage = %q{http://github.com/datamapper/dm-validations}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Library for performing validations on DM models and pure Ruby object}
  s.test_files = [
    "spec/fixtures/barcode.rb",
     "spec/fixtures/basketball_court.rb",
     "spec/fixtures/basketball_player.rb",
     "spec/fixtures/beta_tester_account.rb",
     "spec/fixtures/bill_of_landing.rb",
     "spec/fixtures/boat_dock.rb",
     "spec/fixtures/city.rb",
     "spec/fixtures/company.rb",
     "spec/fixtures/corporate_world.rb",
     "spec/fixtures/country.rb",
     "spec/fixtures/ethernet_frame.rb",
     "spec/fixtures/event.rb",
     "spec/fixtures/g3_concert.rb",
     "spec/fixtures/jabberwock.rb",
     "spec/fixtures/kayak.rb",
     "spec/fixtures/lernean_hydra.rb",
     "spec/fixtures/mathematical_function.rb",
     "spec/fixtures/memory_object.rb",
     "spec/fixtures/mittelschnauzer.rb",
     "spec/fixtures/motor_launch.rb",
     "spec/fixtures/multibyte.rb",
     "spec/fixtures/page.rb",
     "spec/fixtures/phone_number.rb",
     "spec/fixtures/pirogue.rb",
     "spec/fixtures/programming_language.rb",
     "spec/fixtures/reservation.rb",
     "spec/fixtures/scm_operation.rb",
     "spec/fixtures/sms_message.rb",
     "spec/fixtures/udp_packet.rb",
     "spec/integration/absent_field_validator/absent_field_validator_spec.rb",
     "spec/integration/absent_field_validator/spec_helper.rb",
     "spec/integration/acceptance_validator/acceptance_validator_spec.rb",
     "spec/integration/acceptance_validator/spec_helper.rb",
     "spec/integration/automatic_validation/custom_messages_for_inferred_validation_spec.rb",
     "spec/integration/automatic_validation/disabling_inferred_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_boolean_properties_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_float_property_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_format_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_integer_properties_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_length_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_presence_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_primitive_validation_spec.rb",
     "spec/integration/automatic_validation/inferred_within_validation_spec.rb",
     "spec/integration/automatic_validation/spec_helper.rb",
     "spec/integration/block_validator/block_validator_spec.rb",
     "spec/integration/block_validator/spec_helper.rb",
     "spec/integration/conditional_validation/if_condition_spec.rb",
     "spec/integration/conditional_validation/spec_helper.rb",
     "spec/integration/confirmation_validator/confirmation_validator_spec.rb",
     "spec/integration/confirmation_validator/spec_helper.rb",
     "spec/integration/datamapper_models/association_validation_spec.rb",
     "spec/integration/datamapper_models/inheritance_spec.rb",
     "spec/integration/duplicated_validations/duplicated_validations_spec.rb",
     "spec/integration/duplicated_validations/spec_helper.rb",
     "spec/integration/format_validator/email_format_validator_spec.rb",
     "spec/integration/format_validator/format_validator_spec.rb",
     "spec/integration/format_validator/regexp_validator_spec.rb",
     "spec/integration/format_validator/spec_helper.rb",
     "spec/integration/format_validator/url_format_validator_spec.rb",
     "spec/integration/length_validator/default_value_spec.rb",
     "spec/integration/length_validator/equality_spec.rb",
     "spec/integration/length_validator/error_message_spec.rb",
     "spec/integration/length_validator/maximum_spec.rb",
     "spec/integration/length_validator/minimum_spec.rb",
     "spec/integration/length_validator/range_spec.rb",
     "spec/integration/length_validator/spec_helper.rb",
     "spec/integration/method_validator/method_validator_spec.rb",
     "spec/integration/method_validator/spec_helper.rb",
     "spec/integration/numeric_validator/equality_with_float_type_spec.rb",
     "spec/integration/numeric_validator/equality_with_integer_type_spec.rb",
     "spec/integration/numeric_validator/float_type_spec.rb",
     "spec/integration/numeric_validator/gt_with_float_type_spec.rb",
     "spec/integration/numeric_validator/gte_with_float_type_spec.rb",
     "spec/integration/numeric_validator/integer_only_true_spec.rb",
     "spec/integration/numeric_validator/integer_type_spec.rb",
     "spec/integration/numeric_validator/lt_with_float_type_spec.rb",
     "spec/integration/numeric_validator/lte_with_float_type_spec.rb",
     "spec/integration/numeric_validator/spec_helper.rb",
     "spec/integration/primitive_validator/primitive_validator_spec.rb",
     "spec/integration/primitive_validator/spec_helper.rb",
     "spec/integration/pure_ruby_objects/plain_old_ruby_object_validation_spec.rb",
     "spec/integration/required_field_validator/association_spec.rb",
     "spec/integration/required_field_validator/boolean_type_value_spec.rb",
     "spec/integration/required_field_validator/date_type_value_spec.rb",
     "spec/integration/required_field_validator/datetime_type_value_spec.rb",
     "spec/integration/required_field_validator/float_type_value_spec.rb",
     "spec/integration/required_field_validator/integer_type_value_spec.rb",
     "spec/integration/required_field_validator/plain_old_ruby_object_spec.rb",
     "spec/integration/required_field_validator/shared_examples.rb",
     "spec/integration/required_field_validator/spec_helper.rb",
     "spec/integration/required_field_validator/string_type_value_spec.rb",
     "spec/integration/required_field_validator/text_type_value_spec.rb",
     "spec/integration/shared/default_validation_context.rb",
     "spec/integration/shared/valid_and_invalid_model.rb",
     "spec/integration/uniqueness_validator/spec_helper.rb",
     "spec/integration/uniqueness_validator/uniqueness_validator_spec.rb",
     "spec/integration/within_validator/spec_helper.rb",
     "spec/integration/within_validator/within_validator_spec.rb",
     "spec/public/resource_spec.rb",
     "spec/spec_helper.rb",
     "spec/unit/contextual_validators/emptiness_spec.rb",
     "spec/unit/contextual_validators/execution_spec.rb",
     "spec/unit/contextual_validators/spec_helper.rb",
     "spec/unit/generic_validator/equality_operator_spec.rb",
     "spec/unit/validation_errors/adding_spec.rb",
     "spec/unit/validation_errors/emptiness_spec.rb",
     "spec/unit/validation_errors/enumerable_spec.rb",
     "spec/unit/validation_errors/reading_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.0.1"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
      s.add_development_dependency(%q<dm-types>, ["~> 1.0.1"])
    else
      s.add_dependency(%q<dm-core>, ["~> 1.0.1"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
      s.add_dependency(%q<dm-types>, ["~> 1.0.1"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 1.0.1"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
    s.add_dependency(%q<dm-types>, ["~> 1.0.1"])
  end
end

