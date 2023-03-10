# frozen_string_literal: true

class CartItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user == record
  end

  def update?
    user == record
  end

  def destroy?
    user == record
  end
end