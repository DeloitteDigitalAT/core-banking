import React from "react";
import renderer from "react-test-renderer";
import { BrowserRouter } from "react-router-dom";
import Top from "../Top";

describe("UI/Top component", () => {
  test("snapshot renders", () => {
    const tree = renderer
      .create(
        <BrowserRouter>
          <Top />
        </BrowserRouter>,
      )
      .toJSON();
    expect(tree).toMatchSnapshot();
  });
});
