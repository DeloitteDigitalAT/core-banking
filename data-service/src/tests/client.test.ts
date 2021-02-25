import "reflect-metadata";
import { rest } from "msw";
import { setupServer } from "msw/node";
import { gql } from "apollo-server";
import { createTestClient } from "apollo-server-testing";
import { config } from "../config/config";
import clientMock from "./mock/client.json";
import { createServer } from "../utils/createServer";

const mockServer = setupServer(
  rest.get(`${config.accounts.url}/clients/B12456`, (_req, res, ctx) => res(ctx.json(clientMock))),
);

beforeAll(() => mockServer.listen());
afterEach(() => mockServer.resetHandlers());
afterAll(() => mockServer.close());

test("test transactions schema and resolver", async () => {
  const server = await createServer();

  const { query } = createTestClient(server);
  const { data } = await query({
    query: gql`
      {
        client(id: "B12456") {
          clientId
          firstName
          lastName
          socialSecurityNumber
          sex
          dateOfBirth
          accounts {
            accountId
            frequency
            createDate
            transactions {
              accountId
              accountIban
              type
              amount
              balance
              amount
              transId
            }
          }
        }
      }
    `,
  });
  expect(data).toEqual({ client: clientMock });
});
