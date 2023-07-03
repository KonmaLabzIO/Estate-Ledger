**<h2>Derivative Contract:</h2>**

> - Financial instruments that derive their value from an underlying asset, such as properties or tokens.

#### How it works?

> - Derivative contracts create new financial instruments that are based on the future price of properties or tokens. These instruments can take various forms, including options, futures, swaps, or other complex structures. Each type of derivative contract has its own specific characteristics and payout mechanisms.

> - It allow users to speculate on the future price movements of the underlying assets without owning them directly. For example, with options contracts, users can take positions on whether the price of a property or token will rise (call options) or fall (put options) within a specified period. By entering into these contracts, users can potentially profit from correctly predicting the future price movements, even if they don't own the underlying assets.

> - It also serve as risk management tools. Users can hedge their positions and mitigate potential losses by utilizing derivative contracts. For instance, if someone owns a property and is concerned about a potential price decline, they can enter into a futures contract to sell the property at a predetermined price in the future. This protects them from any future price declines as they have locked in the selling price.

> - These contracts often allow users to leverage their positions, meaning they can control a larger position with a smaller amount of capital. This leverage enables users to potentially amplify their returns. However, it's important to note that leverage also increases the risk exposure, as losses can be magnified.

> - It contributes to price discovery and market efficiency. As users engage in speculation and hedging activities, the trading and pricing of these contracts provide valuable information about market expectations and supply-demand dynamics. This information helps in determining fair prices for the underlying assets and facilitates efficient market operations.

> - In conclusion, a derivative contracts provide users with additional financial instruments that are based on the future price of properties or tokens. These contracts allow for speculation on price movements, enabling users to potentially profit from correct predictions. They also offer risk management tools to hedge against potential losses. By leveraging derivative contracts, users can take advantage of market opportunities, manage their risk exposure, and contribute to market efficiency and price discovery.

#### [Code Blocks and explanations](/Derivative-Contracts/DerivativeContract.json):

- - **when**: [...]
    - This line introduces another nested `when` block.
    - It indicates that this nested `when` block will be executed when the previous `then` block is triggered.

- **then**: {...}

  - This line starts a `then` block within the nested `when` block.
  - It specifies the actions to be taken when the event within the nested `when` block occurs.

- **token**:

  - `token_name`: "Land2023-1"
    - This line specifies the name of the token. In this case, the token is named "Land2023-1".
  - `currency_symbol`: "8bb3b343d8e404472337966a722150048c768d0a92a9813596c5338d"
    - This line specifies the currency symbol of the token. The currency symbol is a unique identifier for the token, and it helps differentiate it from other tokens. The value provided here is a hexadecimal representation of the currency symbol.

- **to**: { "party": { "role_token": "Land2023-0" } }

  - This field indicates the recipient of the token transfer.
  - The nested structure `{ "party": { "role_token": "Land2023-0" } }` specifies the recipient as a party with the role token "Land2023-0". In Marlowe, parties are identified by role tokens, which act as unique identifiers for participants in the contract. The "role_token" field specifies the specific role token associated with the party. In this case, the role token is "Land2023-0".

- **pay**: 100, **from_account**: { "role_token": "Land2023-0" }
  - The code snippet `pay: 100, from_account: { "role_token": "Land2023-0" }` is used to specify the source of funds for a token transfer within the Marlowe contract. Let's break down its components:
    - `pay: 100`: This line indicates the amount of the token that will be transferred. In this case, the value is 100. It represents the quantity or value of the token being sent.
    - `from_account: { "role_token": "Land2023-0" }`: This line specifies the account from which the token will be transferred. The "role_token" field indicates the specific role token associated with the account. In this case, the role token is "Land2023-0". Hence, the contract signifies that 100 units of the token will be transferred from the account associated with the role token "Land2023-0". The specified amount will be deducted from the sender's account and transferred to the designated recipient as defined in the `to` field of the token transfer action.
