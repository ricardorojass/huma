# frozen_string_literal: true

class AccessTokenPolicy < ApplicationPolicy

  def create?
    true
  end

  def destroy?
    @user == @record.user
  end
end