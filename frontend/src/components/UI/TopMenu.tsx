import React, { useState } from "react";
import Logo from "./Logo";

const TopMenu: React.FC = () => {
  const [showMenu, setShowMenu] = useState(false);
  const links = [{ text: "Search customer application", link: "/item1" }];
  return (
    <nav className="py-2">
      <div className="max-w-6xl mx-auto px-4 bg-green-100 rounded">
        <div className="flex justify-between">
          <div className={`flex ${showMenu ? "flex-col" : ""} md:flex-row space-x-4`}>
            <div>
              <a href="#" className="flex items-center py-5 px-2 hover:text-gray-900">
                <Logo w={25} h={25} color="#163D97" />
                <span className="font-bold text-denim-800 ml-1">COBAPP</span>
              </a>
            </div>

            <div className={`flex ${showMenu ? "flex-col" : "hidden"} md:flex md:flex-row py-5 list-none ml-auto`}>
              {links.map((el, i) => (
                <a key={i} href="#" className="py-3 md:py-0 px-3 text-gray-700 hover:text-gray-900">
                  {el.text}
                </a>
              ))}
            </div>
          </div>

          <div className="md:hidden flex items-start py-5">
            <button
              type="button"
              className="outline-none focus:outline-none"
              onClick={() => setShowMenu(prevState => !prevState)}
            >
              <svg
                className="w-6 h-6"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default TopMenu;
