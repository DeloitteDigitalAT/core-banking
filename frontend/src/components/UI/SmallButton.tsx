import React from "react";

interface ButtonType {
  text: string;
  handler: () => void;
  active: boolean;
  extraClass?: string;
}

const SmallButton: React.FC<ButtonType> = properties => {
  const { text, handler, active, extraClass } = properties;
  return (
    <button
      type="button"
      className={`${
        active
          ? "bg-gradient-to-b from-green-100 to-green-200 border-green-100 text-xs hover:bg-green-400 hover:from-green-200 hover:to-green-300 border text-green-800"
          : "bg-gray-200 text-gray-400"
      } rounded-md px-2 py-0 transition duration-500 ease select-none focus:outline-none focus:shadow-outline ${extraClass}`}
      onClick={handler}
    >
      {text}
    </button>
  );
};

export default SmallButton;
