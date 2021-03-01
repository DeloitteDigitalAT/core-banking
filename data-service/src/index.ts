import "reflect-metadata";
import { createServer } from "./utils/createServer";
import { errorHandler } from "./utils/errorHandler";
import Express from "express";

const PORT = process.env.PORT || 4000;

const bootstrap = async () => {
  const server = await createServer();

  const app = Express();
  server.applyMiddleware({ app });
  app.use(errorHandler);

  // Start the server
  app.listen(PORT, () =>
    // eslint-disable-next-line no-console
    console.log(`Server is running, GraphQL Playground available at http://localhost:4000/graphql`),
  );
};

bootstrap();
