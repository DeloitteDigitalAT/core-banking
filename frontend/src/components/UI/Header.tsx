import React from "react";

const Header: React.FC = properties => {
  return <div className="text-xl py-4 mb-0 text-gray-800">{properties.children}</div>;
};

export default Header;
