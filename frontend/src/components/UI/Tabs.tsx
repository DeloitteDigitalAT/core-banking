import React from "react";

interface ElementType {
  name: string;
  id: number;
  active: boolean;
}

interface TabsType {
  elements: ElementType[];
  setElements: (el: ElementType[]) => void;
}

const Tabs: React.FC<TabsType> = properties => {
  const { elements, setElements } = properties;
  const setActiveElement = (id: number) => {
    const updElements = elements.map(element => {
      if (element.id === id) {
        element.active = true;
      } else {
        element.active = false;
      }
      return element;
    });
    setElements(updElements);
  };
  return (
    <ul className="list-reset flex border-b mb-4">
      {elements.map((el, id) => (
        <li className="-mb-px mr-1" key={id}>
          <div
            className={`bg-white inline-block py-2 px-4 text-sm  cursor-pointer ${
              el.active
                ? "font-semibold text-gray-800 border-l border-t border-r rounded-t"
                : "text-gray-400 hover:text-gray-800"
            }`}
            onClick={() => setActiveElement(el.id)}
          >
            {el.name}
          </div>
        </li>
      ))}
    </ul>
  );
};

export default Tabs;
