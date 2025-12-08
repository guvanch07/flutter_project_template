BITBUCKET_BRANCH ?= $(shell git branch --show-current)

init: 
	$(MAKE) clean
	$(MAKE) pub_get
	$(MAKE) generate_models_delete_conflicting
	$(MAKE) slang

clean:
	flutter clean

pub_get:
	flutter pub get

generate_models:
	dart run build_runner build

generate_models_delete_conflicting:
	dart run build_runner build -d

slang:
	dart run slang

build_ipa_prod:
	flutter build ipa
	$(MAKE) deploy_ipa

build_ipa_dev:
	flutter build ipa --dart-define="APP_ENV=development" --dart-define="FEATURE_NAME=$(BITBUCKET_BRANCH)"
	$(MAKE) deploy_ipa

build_appbundle_prod:
	flutter build appbundle --split-debug-info=symbols/{{project_name}}
	firebase crashlytics:symbols:upload --app=$(FIREBASE_APP_ID) symbols/{{project_name}}

build_appbundle_dev:
	flutter build appbundle --split-debug-info=symbols/{{project_name}} --dart-define="APP_ENV=development" --dart-define="FEATURE_NAME=$(BITBUCKET_BRANCH)"
	firebase crashlytics:symbols:upload --app=$(FIREBASE_APP_ID) symbols/{{project_name}}

deploy_ipa:
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey HHVAC4M5KV --apiIssuer 9e086b66-613e-4750-94ca-59bbe7a9b559


.PHONY: init clean pub_get generate_models generate_models_delete_conflicting slang build_ipa_prod build_ipa_dev build_appbundle_prod build_appbundle_dev deploy_ipa
