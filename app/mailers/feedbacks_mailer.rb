# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def send_feedback(email, name, msg)
    @email = email
    @name = name
    @msg = msg
    mail to: ENV['ADMIN_EMAIL'], subject: I18n.t('label.feedback_subject', email: @email)
  end
end
