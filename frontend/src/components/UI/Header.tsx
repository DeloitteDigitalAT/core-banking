import React from "react";

const Header: React.FC = properties => {
  return <div className="text-2xl py-2 text-denim-800">{properties.children}</div>;
};

export default Header;
