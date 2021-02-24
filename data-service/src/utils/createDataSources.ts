import AccountsAPI from "../api/Accounts";
import TransactionsAPI from "../api/Transactions";

export default (): any => {
  return {
    AccountsAPI: new AccountsAPI(),
    TransactionsAPI: new TransactionsAPI(),
  };
};
