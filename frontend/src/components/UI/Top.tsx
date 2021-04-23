import React from "react";
import { Link } from "react-router-dom";
import Logo from "./Logo";

const Top: React.FC = () => {
  return (
    <div>
      <nav className="py-2">
        <div className="max-w-6xl mx-auto px-4 bg-gradient-to-b from-green-100 via-green-200 to-green-200 rounded">
          <div className="flex justify-between">
            <div className="flex md:flex-row space-x-4">
              <div className="bg-green-100 mt-2 mb-2 rounded bg-opacity-20 hover:bg-opacity-40">
                <Link to="/" className="flex items-center py-2 px-3 hover:text-gray-900">
                  <Logo w={30} h={30} color="#163D97" />
                  <span className="font-bold text-denim-800 ml-1 text-lg pt-1">COBAPP</span>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  );
};

export default Top;
