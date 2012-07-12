if Rails.env.development?
  require 'i18n/missing_translations'
  Rails.application.config.app_middleware.use(I18n::MissingTranslations)
end