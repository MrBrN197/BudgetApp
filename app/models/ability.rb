# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # user ||= User.new # guest user (not logged in)
    can :manage, Category, user: user
    can :manage, Record, user: user
  end
end
