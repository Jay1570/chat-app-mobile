.PHONY: run run-web run-linux build-apk build-appbundle build-web clean get gen

get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

run:
	flutter run

run-web-server:
	flutter run -d web-server --web-port 8080

run-web:
	flutter run -d chrome --web-port 8080

run-linux:
	flutter run -d linux

build-apk:
	flutter build apk --release

build-appbundle:
	flutter build appbundle --release

build-web:
	flutter build web --release

clean:
	flutter clean
	flutter pub get
