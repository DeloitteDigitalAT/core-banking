import "reflect-metadata";
import { rest } from "msw";
import { setupServer } from "msw/node";
import { gql } from "apollo-server-express";
import { createTestClient } from "apollo-server-testing";
import { config } from "../config/config";
import accountsMock from "./mock/accounts.json";
import transactionsMock from "./mock/transactions.json";
import { createServer } from "../utils/createServer";

const mockServer = setupServer(
  rest.get(`${config.accounts.url}/clients/B12456/accounts`, (_req, res, ctx) => res(ctx.json(accountsMock))),
  rest.get(`${config.transactions.url}/transactions`, (_req, res, ctx) => res(ctx.json(transactionsMock))),
);

beforeAll(() => mockServer.listen());
afterEach(() => mockServer.resetHandlers());
afterAll(() => mockServer.close());

test("test Accounts schema and resolver", async () => {
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
