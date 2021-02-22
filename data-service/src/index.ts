import "reflect-metadata";
import { ApolloServer } from "apollo-server";
import { createSchema } from "./utils/createSchema";

const PORT = process.env.PORT || 4000;

const bootstrap = async () => {
  // ... Building schema here
  const schema = await createSchema();

  // Create the GraphQL server
  const server = new ApolloServer({
    schema,
    playground: true,
  });

  // Start the server
  const { url } = await server.listen(PORT);
  console.log(`Server is running, GraphQL Playground available at ${url}`);
};

bootstrap();
