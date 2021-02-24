import { ApolloServer } from "apollo-server";
import { createSchema } from "./createSchema";
import dataSources from "./createDataSources";

export const createServer = async (): Promise<ApolloServer> => {
  // ... Building schema here
  const schema = await createSchema();

  // Create the GraphQL server
  return new ApolloServer({
    schema,
    playground: true,
    dataSources,
  });
};
