import { ApolloServer, gql } from "apollo-server";
import * as fs from "fs";
import { Division, QueryResolvers } from "./generated/graphql";

const typeDefs = gql`
  ${fs.readFileSync(__dirname.concat("/schema.gql"), "utf8")}
`;

// data.json から取得するデータの型を表す
interface ContextFromFile {
  divisions: Division[];
}

const resolvers: { Query: QueryResolvers<ContextFromFile> } = {
  Query: {
    divisions: async (_parent, _args, context, _info) => {
      return context.divisions;
    },
  },
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context: async ({ req }: any) => {
    try {
      const jsonDataFile = __dirname.concat("/data.json");
      const fileContent = await fs.promises.readFile(jsonDataFile, "utf8");
      const jsonData = JSON.parse(fileContent);
      return {
        divisions: jsonData,
      };
    } catch (err) {
      console.log("***ERROR OCURRED***");
      console.log(err);
      throw new Error("internal error happened!!");
    }
  },
});

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
