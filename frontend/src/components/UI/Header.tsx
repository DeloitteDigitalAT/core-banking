import React from "react";

const Header: React.FC = properties => {
  return <div className="text-2xl py-4 mb-4 text-gray-800">{properties.children}</div>;
};

export default Header;
