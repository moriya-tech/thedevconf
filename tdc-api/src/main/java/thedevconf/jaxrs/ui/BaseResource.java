package thedevconf.jaxrs.ui;

import io.quarkus.qute.Template;
import io.quarkus.qute.TemplateInstance;
import thedevconf.jaxrs.Configuration;

import javax.inject.Inject;

public class BaseResource {
    @Inject
    Configuration cfg;

    TemplateInstance instanceOf(Template tpl) {
        TemplateInstance template = tpl.data("cfg", cfg);
        return template;
    }
}
