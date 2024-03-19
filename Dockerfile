FROM --platform=linux/amd64 ruby:3.3.0

RUN gem install sass-embedded

RUN apt-get update && apt-get install -y nodejs npm 

RUN gem install bundler

RUN gem install jekyll
RUN mkdir /platoniq.net
WORKDIR /platoniq.net
VOLUME /platoniq.net
EXPOSE 4000
COPY . .

RUN bundle install
RUN npx netlify-cms-proxy-server & 
CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]
