# frozen_string_literal: true

class UserPresenter < BasePresenter
  FIELDS = %i[id email name role last_logged_in_at
              confirmed_at confirmation_sent_at reset_password_sent_at
              created_at updated_at]

  related_to :cart_items
  sort_by *FIELDS
  filter_by *FIELDS
  build_with *[FIELDS.push([:confirmation_token, :reset_password_token,
                            :confirmation_redirect_url,
                            :reset_password_redirect_url])].flatten
end
