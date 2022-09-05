import * as riot from "riot";
import i18next from "i18next";
import i18nextHttpBackend from "i18next-http-backend";
import i18nextBrowserLanguagedetector from "i18next-browser-languagedetector";

import "./tags/index.tag";
import "./tags/i18n.tag";

const app = document.createElement("div");
app.setAttribute("id", "app");
document.body.appendChild(app);

i18next
  .use(i18nextHttpBackend)
  .use(i18nextBrowserLanguagedetector)
  .init(
    {
      lng: "ja",
      fallbackLng: "ja",
      ns: ["translation", "enums"],
      backend: {
        loadPath: "locales/{{lng}}/{{ns}}.json",
      },
    },
    async () => {
      riot.mount("#app", "index");
    }
  );
