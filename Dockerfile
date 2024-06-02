FROM ruby:3.2.0-slim AS base

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      pkg-config && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 999 cruises && \
    useradd --system --create-home --uid 999 --gid cruises cruises

WORKDIR /app
RUN chown cruises:cruises .

COPY Gemfile* ./

RUN bundle install

FROM base

USER cruises

COPY --chown=cruises:cruises . .

CMD rake console
