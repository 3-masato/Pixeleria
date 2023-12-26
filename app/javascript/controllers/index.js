// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";

import ReportStatus from "./report-status_controller";
import Input from "./input_controller";
import Tag from "./tag_controller";
import Editor from "./editor_controller";
import Kebab from "./kebab_controller";

application.register("report-status", ReportStatus);
application.register("input", Input);
application.register("tag", Tag);
application.register("editor", Editor);
application.register("kebab", Kebab);
