FROM --platform=linux/amd64 ruby:3.3

# RUN curl -LO https://rubygems.org/rubygems/rubygems-3.3.22.tgz && \
#     tar -xzf rubygems-3.3.22.tgz && \
#     cd rubygems-3.3.22 && \
#     ruby setup.rb --no-document && \
#     cd .. && \
#     rm -rf rubygems-3.3.22 rubygems-3.3.22.tgz

#RUN gem install sass-embedded -v 1.63.6

RUN apt-get update && apt-get install -y nodejs npm 

#RUN gem install bundler -v 2.4.22

RUN gem install jekyll
RUN mkdir /platoniq.net
WORKDIR /platoniq.net
VOLUME /platoniq.net
EXPOSE 4000
COPY . .

RUN bundle install
RUN npx netlify-cms-proxy-server & 
CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]