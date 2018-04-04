# Elixir
FROM elixir:1.6.2-alpine
ENV MIX_ENV=prod
RUN apk add --no-cache alpine-sdk
RUN apk add --no-cache bash

RUN yes | mix local.hex
RUN yes | mix local.rebar

WORKDIR /tmp
ADD mix.exs .
ADD mix.lock .
RUN mix deps.get
RUN mix deps.compile
RUN ls

WORKDIR /app
ADD . .
RUN ls -lah
RUN rm -rf deps
RUN rm -rf _build
RUN mv /tmp/deps .
RUN mv /tmp/_build .
RUN ./local mix test
RUN mix release
RUN chmod +x "_build/prod/rel/ridehealth/bin/ridehealth"

CMD ["_build/prod/rel/ridehealth/bin/ridehealth",  "foreground"]