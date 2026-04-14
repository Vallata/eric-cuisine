class ApplicationMailer < ActionMailer::Base
  default from: -> { Rails.application.credentials.dig(:gmail, :username) || 'noreply@eric-cuisine.fr' }
  layout false
end
