/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let carousel = function () {
    return React.createElement(
            "div", {
                className: "container my-5"
            },
            React.createElement(
                    "div", {
                        className: "carousel slide shadow rounded overflow-hidden",
                        id: "carousel-1",
                        'data-bs-ride': "carousel"
                    },
                    React.createElement(
                            "div", {
                                className: "carousel-indicators"
                            },
                            React.createElement(
                                    "button", {
                                        type: "button",
                                        'data-bs-target': "#carousel-1",
                                        'data-bs-slide-to': "0",
                                        className: "active",
                                        'aria-current': "true",
                                        'aria-label': "Slide 1"
                                    },
                                    null),
                            React.createElement(
                                    "button", {
                                        type: "button",
                                        'data-bs-target': "#carousel-1",
                                        'data-bs-slide-to': "1",
                                        'aria-label': "Slide 2"
                                    },
                                    null),
                            React.createElement(
                                    "button", {
                                        type: "button",
                                        'data-bs-target': "#carousel-1",
                                        'data-bs-slide-to': "2",
                                        'aria-label': "Slide 3"
                                    },
                                    null)
                            ),
                    React.createElement(
                            "div", {
                                className: "carousel-inner"
                            },
                            React.createElement(
                                    "div", {
                                        className: "carousel-item active"
                                    },
                                    React.createElement(
                                            "img", {
                                                className: "d-block w-100",
                                                style: {height: "400px", objectFit: "cover"},
                                                src: "/pixelmart/images/carousel/slide1.jpg",
                                                alt: "Image 1"
                                            }),
                                    React.createElement(
                                            "div", {
                                                className: "text-dark carousel-caption d-none d-md-block top-50 start-0 translate-middle-y text-start",
                                                style: {'padding-left': "12rem"}
                                            },
                                            React.createElement(
                                                    "h5", {
                                                        className: "mb-3"
                                                    },
                                                    "Discover a Smarter Way to Shop"),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-1"
                                                    },
                                                    "Explore a wide range of high-quality products from trusted sellers."
                                                    ),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-0"
                                                    },
                                                    "Find everything you need in one place — curated for value, style, and reliability.")
                                            )
                                    ),
                            React.createElement(
                                    "div", {
                                        className: "carousel-item"
                                    },
                                    React.createElement(
                                            "img", {
                                                className: "d-block w-100",
                                                style: {height: "400px", objectFit: "cover"},
                                                src: "/pixelmart/images/carousel/slide2.jpg",
                                                alt: "Image 2"
                                            }),
                                    React.createElement(
                                            "div", {
                                                className: "text-dark carousel-caption d-none d-md-block top-50 end-0 translate-middle-y text-end",
                                                style: {'padding-right': "12rem"}
                                            },
                                            React.createElement(
                                                    "h5", {
                                                        className: "mb-3"
                                                    },
                                                    "More Value for Every Purchase"),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-1"
                                                    },
                                                    "Enjoy exclusive discounts, seasonal offers, and unbeatable prices."
                                                    ),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-0"
                                                    },
                                                    "Shop confidently knowing you’re always getting the best deal.")
                                            )
                                    ),
                            React.createElement(
                                    "div", {
                                        className: "carousel-item"
                                    },
                                    React.createElement(
                                            "img", {
                                                className: "d-block w-100",
                                                style: {height: "400px", objectFit: "cover"},
                                                src: "/pixelmart/images/carousel/slide3.jpg",
                                                alt: "Image 3"
                                            }),
                                    React.createElement(
                                            "div", {
                                                className: "text-dark carousel-caption d-none d-md-block top-50 start-0 translate-middle-y text-start",
                                                style: {'padding-left': "12rem"}
                                            },
                                            React.createElement(
                                                    "h5", {
                                                        className: "mb-3"
                                                    },
                                                    "Built for Comfort, Designed for You"),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-1"
                                                    },
                                                    "From browsing to checkout, PixelMart delivers a smooth and secure"
                                                    ),
                                            React.createElement(
                                                    "p", {
                                                        className: "mb-0"
                                                    },
                                                    "shopping experience with fast delivery and easy returns."
                                                    )
                                            )
                                    )
                            ),
                    React.createElement(
                            "button", {
                                className: "carousel-control-prev",
                                type: "button",
                                'data-bs-target': "#carousel-1",
                                'data-bs-slide': "prev"
                            },
                            React.createElement(
                                    "span", {
                                        className: "carousel-control-prev-icon",
                                        'aria-hidden': "true"
                                    },
                                    null),
                            React.createElement(
                                    "span", {
                                        className: "visually-hidden"
                                    },
                                    "Previous")),
                    React.createElement(
                            "button", {
                                className: "carousel-control-next",
                                type: "button",
                                'data-bs-target': "#carousel-1",
                                'data-bs-slide': "next"
                            },
                            React.createElement(
                                    "span", {
                                        className: "carousel-control-next-icon",
                                        'aria-hidden': "true"
                                    },
                                    null),
                            React.createElement(
                                    "span", {
                                        className: "visually-hidden"
                                    },
                                    "Next")
                            )
                    )
            );
};
ReactDOM.render(React.createElement(carousel, null, null), document.getElementById("carousel-show"));