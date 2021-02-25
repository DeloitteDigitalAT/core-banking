import "reflect-metadata";
import { rest } from "msw";
import { setupServer } from "msw/node";
import { gql } from "apollo-server";
import { createTestClient } from "apollo-server-testing";
import { config } from "../config/config";
import accountsMock from "./mock/accounts.json";
import { createServer } from "../utils/createServer";

const mockServer = setupServer(
  rest.get(`${config.accounts.url}/clients/B12456/accounts`, (_req, res, ctx) => res(ctx.json(accountsMock))),
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
        accounts(clientId: "B12456") {
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
    `,
  });
  expect(data).toEqual({ accounts: accountsMock });
});
