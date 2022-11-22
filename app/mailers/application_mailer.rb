# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <noreply@testguru.com>)
  layout 'mailer'
end
