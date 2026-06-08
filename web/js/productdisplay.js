/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/*
 =================================================
 PIXELMART PRODUCT DETAILS PAGE
 products.js
 =================================================
 */

let quantity = 1;

/*
 =================================================
 QUANTITY CONTROLS
 =================================================
 */

document.addEventListener("DOMContentLoaded", function () {

    let plusBtn =
            document.getElementById(
                    "plusBtn"
                    );

    let minusBtn =
            document.getElementById(
                    "minusBtn"
                    );

    let qtyValue =
            document.getElementById(
                    "qtyValue"
                    );

    if (plusBtn && minusBtn && qtyValue) {

        plusBtn.addEventListener(
                "click",
                function () {

                    quantity++;

                    qtyValue.textContent =
                            quantity;
                });

        minusBtn.addEventListener(
                "click",
                function () {

                    if (quantity > 1) {

                        quantity--;

                        qtyValue.textContent =
                                quantity;
                    }
                });
    }

    loadRelatedProducts();
});

/*
 =================================================
 ADD TO CART
 =================================================
 */

function addToCart(
        pid
        ) {

    let btn =
            document.querySelector(
                    ".btn-cart"
                    );

    if (!btn)
        return;

    let originalText =
            btn.innerHTML;

    btn.disabled = true;

    btn.innerHTML =
            `
        <span
            class="spinner-border spinner-border-sm me-2">
        </span>
        Adding...
    `;

    let xhr =
            new XMLHttpRequest();

    xhr.onreadystatechange =
            function () {

                if (xhr.readyState === 4) {

                    btn.disabled = false;

                    if (
                            (xhr.status >= 200
                                    && xhr.status < 300)
                            || xhr.status === 304
                            ) {

                        btn.innerHTML =
                                `
                            <i class="bi bi-check-circle-fill me-2"></i>
                            Added To Cart
                        `;

                        setTimeout(
                                function () {

                                    btn.innerHTML =
                                            originalText;
                                },
                                2500
                                );

                    } else {

                        btn.innerHTML =
                                originalText;
                    }
                }
            };

    xhr.open(
            "GET",
            `fc/cart?pid=${pid}&qty=${quantity}`,
            true
            );

    xhr.send(null);
}

/*
 =================================================
 BUY NOW
 =================================================
 */

function buyNow(
        pid
        ) {

    window.location.href =
            `checkout?pid=${pid}&qty=${quantity}`;
}

/*
 =================================================
 WISHLIST
 =================================================
 */

function toggleWishlist(
        pid
        ) {

    let btn =
            document.querySelector(
                    ".btn-wishlist"
                    );

    if (!btn)
        return;

    btn.classList.toggle(
            "wishlist-active"
            );

    let icon =
            btn.querySelector(
                    "i"
                    );

    if (
            icon.classList.contains(
                    "bi-heart"
                    )
            ) {

        icon.classList.remove(
                "bi-heart"
                );

        icon.classList.add(
                "bi-heart-fill"
                );

    } else {

        icon.classList.remove(
                "bi-heart-fill"
                );

        icon.classList.add(
                "bi-heart"
                );
    }

    /*
     AJAX endpoint later
     
     fc/wishlist?pid=...
     */
}

/*
 =================================================
 RELATED PRODUCTS
 =================================================
 */

function loadRelatedProducts() {

    let container =
            document.getElementById(
                    "relatedProducts"
                    );

    if (!container)
        return;

    showSkeletonLoader();

    /*
     Replace with your endpoint
     
     Example:
     
     fc/relatedproducts?sid=...
     */

    let xhr =
            new XMLHttpRequest();

    xhr.onreadystatechange =
            function () {

                if (xhr.readyState === 4) {

                    if (
                            (xhr.status >= 200
                                    && xhr.status < 300)
                            || xhr.status === 304
                            ) {

                        let jarr =
                                JSON.parse(
                                        xhr.responseText
                                        );

                        renderRelatedProducts(
                                jarr
                                );
                    }
                }
            };

    /*
     TEMPORARY
     
     Uncomment later
     
     xhr.open(
     "GET",
     "fc/relatedproducts",
     true
     );
     
     xhr.send(null);
     */

    setTimeout(
            function () {

                renderRelatedProducts(
                        []
                        );
            },
            1200
            );
}

/*
 =================================================
 SKELETON LOADER
 =================================================
 */

function showSkeletonLoader() {

    let container =
            document.getElementById(
                    "relatedProducts"
                    );

    let skeletons = "";

    for (
            let i = 0;
            i < 4;
            i++
            ) {

        skeletons +=
                `
            <div class="col-lg-3 col-md-6">

                <div class="related-product-card">

                    <div
                        class="placeholder-glow p-4">

                        <span
                            class="placeholder col-12"
                            style="height:220px;">
                        </span>

                        <span
                            class="placeholder col-8 mt-3">
                        </span>

                        <span
                            class="placeholder col-5 mt-2">
                        </span>

                    </div>

                </div>

            </div>
        `;
    }

    container.innerHTML =
            `
        <div class="row g-4">

            ${skeletons}

        </div>
    `;
}

/*
 =================================================
 RENDER RELATED PRODUCTS
 =================================================
 */

function renderRelatedProducts(
        products
        ) {

    let container =
            document.getElementById(
                    "relatedProducts"
                    );

    /*
     TEMP DEMO
     REMOVE AFTER API READY
     */

    if (
            products.length === 0
            ) {

        products = [

            {
                id: 1,
                name: "Premium Product",
                price: 2999,
                image: "images/demo.png"
            },

            {
                id: 2,
                name: "Smart Device",
                price: 4999,
                image: "images/demo.png"
            },

            {
                id: 3,
                name: "Wireless Accessory",
                price: 1999,
                image: "images/demo.png"
            },

            {
                id: 4,
                name: "Tech Gadget",
                price: 7999,
                image: "images/demo.png"
            }
        ];
    }

    let cards =
            products.map(
                    function (
                            product
                            ) {

                        return `
                <div class="col-lg-3 col-md-6">

                    <a
                        href="proddtls?pid=${product.id}"
                        class="text-decoration-none">

                        <div
                            class="related-product-card">

                            <img
                                src="${product.image}"
                                class="img-fluid related-product-image"
                                alt="${product.name}">

                            <div
                                class="related-product-body">

                                <h6
                                    class="text-dark fw-semibold">

                                    ${product.name}

                                </h6>

                                <div
                                    class="text-success fw-bold">

                                    $${Number(product.price).toFixed(2)}

                                </div>

                            </div>

                        </div>

                    </a>

                </div>
            `;
                    }
            ).join("");

    container.innerHTML =
            `
        <div class="row g-4">

            ${cards}

        </div>
    `;
}

/*
 =================================================
 SMOOTH SCROLL ANIMATION
 =================================================
 */

const observer =
        new IntersectionObserver(
                function (
                        entries
                        ) {

                    entries.forEach(
                            function (
                                    entry
                                    ) {

                                if (
                                        entry.isIntersecting
                                        ) {

                                    entry.target.classList.add(
                                            "show-section"
                                            );
                                }
                            }
                    );
                },
                {
                    threshold: 0.1
                }
        );

document.addEventListener(
        "DOMContentLoaded",
        function () {

            document.querySelectorAll(
                    ".content-surface,"
                    + ".feature-card,"
                    + ".spec-card,"
                    + ".delivery-card"
                    )
                    .forEach(
                            function (
                                    el
                                    ) {

                                observer.observe(
                                        el
                                        );
                            }
                    );
        }
);

/*
 =================================================
 HELPER
 =================================================
 */

function getSelectedQuantity() {

    return quantity;
}