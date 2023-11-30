---
collection: index
layout: base
---

{% assign locale = page.locale %}
{% assign categories = site.categories | where: "locale", page.locale %}
{% assign projects = site.projects | where: "locale", page.locale %}

<section id="hero" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-wrap flex-row pb-lg-5">
  
      <div class="d-flex col-lg-5 col-8 pb-3 order-lg-2">
        <h1 class="align-self-end">{{ site.data[locale].homepage.main.main_title }}</h1>
      </div>
      <div class="col-lg-6 col-4 order-lg-3">
        <img src="{{ site.data[locale].homepage.main.main_img }}" alt="happy_faces" class="img-fluid" loading="lazy">
      </div>
      <div class="d-flex col-lg col-12 p-0 order-lg-1">
        <p class="align-self-center vertical-text">
          {{ site.data[locale].homepage.main.main_subtitle }}
        </p>
      </div>
    </div>
  </section>
  
  <section id="footer_sub_hero" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-column pb-lg-5">
      <div class="row w-lg-60 align-self-center gap-3">
        <p>{{ site.data[locale].homepage.main.main_description }}</p>
      </div>

      <div class="d-flex flex-lg-row flex-column p-3">
        {% for category in categories %}
          <div class="d-flex flex-row">
            <div class="vr m-3"></div>
            <div class="d-flex flex-lg-column flex-row justify-content-around align-items-lg-start align-items-center">
              <div class="icon-width">
                <img src={{ category.symbol.path }} class="img-thumbnail bg-transparent border-0" alt={{ category.symbol.alt }} loading="lazy">
              </div>
              <div class="d-flex flex-fill">
                <h4>{{ category.title }}</h4>
              </div>
              <div class="d-flex flex-fill justify-content-lg-start justify-content-end align-items-end">
                <a href={{ category |  relative_url }}>
                  <button type="button" class="btn no-border" aria-label="go to categoty">
                    <i class="fa-solid fa-arrow-right"></i>
                  </button>
                </a>
              </div>
            </div>
          </div>
        {% endfor %}
      </div>
    </div> 
  </section>
  
  <section id="our_values" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-column pb-lg-5">
      <div class="d-flex flex-row pb-3 align-items-center">
        <div class="col-8">
          <h1>{{ site.data[locale].homepage.main.values_title}}</h1>
          <p>{{ site.data[locale].homepage.main.values_description }}</p>
        </div>
        <div class="col">
          <img src="{{ site.data[locale].homepage.main.values_img }}" alt="heart" class="img-fluid"loading="lazy">
        </div>
      </div>
  
      <div class="d-flex flex-row flex-wrap">
        {% for description in site.data[locale].homepage.values %}
          <div class="flex-column value">
            <p>{{ description }}</p>
            <hr class="hr me-lg-3"></hr>
          </div>
        {% endfor %}
      </div>
  
    </div>
  </section>
  
  <section id="recent_projects" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-column pb-lg-5  pb-3">
      <h1>{{ site.data[locale].global.recent_projects }}</h1>
    </div>
    {% assign related_projects = site.projects | where: "locale", page.locale | reverse %}
    {% include partials/recent_projects.liquid %} 
  </section>

  <!-- <section id="our_journal" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-column pb-lg-5">
      <h1>{{ site.data[locale].homepage.main.journal_title }}</h1>
    </div>
  </section> -->

  <section id="work_with" class="pb-lg-5 pb-3">
    <div class="container-lg d-flex flex-column pb-lg-5">
      <h1>{{ site.data[locale].homepage.main.who_title }}</h1>
    </div>

    {% assign collaborators = site.collaborators | where: "locale", page.locale %}
    <div class="container-lg d-flex flex-row flex-wrap justify-content-between">
      {% for collaborator in collaborators %}
        <div class="col-lg-3 col-5 pe-5 ps-5 p-2">
          <img src={{ collaborator.logo.path }} class="img-thumbnail bg-transparent border-0" alt={{ collaborator.logo.alt }}>
        </div>
      {% endfor %}
    </div>
  </section>










