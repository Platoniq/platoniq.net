# platoniq.net

## Development

This project is made up of 2 repositories, [`jekyll-theme-platoniq.net`](https://github.com/Platoniq/jekyll-theme-platoniq.net), which contains the templates and assets, and this one, which contains the content.

The templates and assets of the theme repository are encapsulated into a gem imported to be used in this repository, using the Gemfile.

To use in local, you can download both repositories, place them into the same folder, and change the Gemfile to import the gem from your local theme repository instead of doing it from [`jekyll-theme-platoniq.net`](https://github.com/Platoniq/jekyll-theme-platoniq.net)

Before that, build the container:

    docker compose build 

Once you have created the container, you can change the Gemfile, specifying the local path:

    gem "jekyll-theme-platoniq.net", path: "../jekyll-theme-platoniq.net"

And then, add the repository as a volume to the container, appending to your `docker-compose.yml`:

    - ../jekyll-theme-platoniq.net:/jekyll-theme-platoniq.net

Now you can start modifying the theme repository. To see the changes in your content repository, you have to update the gem. To do that:

In a terminal, to access to the container, run:

    docker compose run jekyll bash

And then (if it is the first time) do:

    bundle install 

The next times you can just do:

    bundle update

And, in another terminal, you are now ready to launch the container:

    docker compose up

## Netlify CMS in local

To use the Content Management System of Netlify in local:

At `netlifycms/config.yml` you have to add: 

    local_backend: true

Then, open a terminal in the same folder where the content repository is, and run:

    npx netlify-cms-proxy-server

Then, on another terminal in the same folder:

    docker compose up

And now you can go to http://localhost:4000/cms, where you will be able to see the CMS dashboard.