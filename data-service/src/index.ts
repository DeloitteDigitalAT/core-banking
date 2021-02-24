import "reflect-metadata";
import { createServer } from "./utils/createServer";

const PORT = process.env.PORT || 4000;

const bootstrap = async () => {
  const server = await createServer();

  // Start the server
  const { url } = await server.listen(PORT);
  console.log(`Server is running, GraphQL Playground available at ${url}`);
};

bootstrap();
