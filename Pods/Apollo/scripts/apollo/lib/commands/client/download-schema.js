"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const graphql_1 = require("graphql");
const fs_1 = require("fs");
const Command_1 = require("../../Command");
class SchemaDownload extends Command_1.ClientCommand {
    async run() {
        let result;
        let gitContext;
        await this.runTasks(({ args, project, flags }) => {
            const extension = args.output.split(".").pop();
            const isSDLFormat = ["graphql", "graphqls", "gql"].includes(extension);
            return [
                {
                    title: `Saving schema to ${args.output}`,
                    task: async () => {
                        const schema = await project.resolveSchema({ tag: flags.tag });
                        const formattedSchema = isSDLFormat
                            ? graphql_1.printSchema(schema)
                            : JSON.stringify(graphql_1.introspectionFromSchema(schema), null, 2);
                        fs_1.writeFileSync(args.output, formattedSchema);
                    }
                }
            ];
        });
    }
}
exports.default = SchemaDownload;
SchemaDownload.description = "Download a schema from Apollo Graph Manager or a GraphQL endpoint in JSON or SDL format";
SchemaDownload.flags = Object.assign({}, Command_1.ClientCommand.flags);
SchemaDownload.args = [
    {
        name: "output",
        description: "Path to write the introspection result to. Can be `.graphql`, `.gql`, `.graphqls`, or `.json`",
        required: true,
        default: "schema.json"
    }
];
//# sourceMappingURL=download-schema.js.map