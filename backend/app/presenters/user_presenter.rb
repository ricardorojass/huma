# # frozen_string_literal: true

# class UserPresenter < BasePresenter
#   FIELDS = %i[id email given_name family_name role last_logged_in_at
#               confirmed_at confirmation_sent_at reset_password_sent_at
#               created_at updated_at].freeze

#   sort_by *FIELDS
#   filter_by *FIELDS
#   build_with *FIELDS, :confirmation_token, :confirmation_redirect_url, :reset_password_token, :reset_password_redirect_url
#   # confirmation_redirect_url
# end