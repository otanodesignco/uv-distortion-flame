// Linear
float easeLinear(float t) 
{

    return t;
    
}

// Quad
float easeInQuad(float t) {
    return t * t;
}

float easeOutQuad(float t) {
    return t * (2.0 - t);
}

float easeInOutQuad(float t) {
    return t < 0.5 
        ? 2.0 * t * t 
        : -1.0 + (4.0 - 2.0 * t) * t;
}

// Cubic
float easeInCubic(float t) {
    return t * t * t;
}

float easeOutCubic(float t) {
    float t1 = t - 1.0;
    return 1.0 + t1 * t1 * t1;
}

float easeInOutCubic(float t) {
    return t < 0.5
        ? 4.0 * t * t * t
        : (t - 1.0) * (2.0 * t - 2.0) * (2.0 * t - 2.0) + 1.0;
}

// Quart
float easeInQuart(float t) {
    return t * t * t * t;
}

float easeOutQuart(float t) {
    float t1 = t - 1.0;
    return 1.0 - t1 * t1 * t1 * t1;
}

float easeInOutQuart(float t) {
    float t1 = t - 1.0;
    return t < 0.5
        ? 8.0 * t * t * t * t
        : 1.0 - 8.0 * t1 * t1 * t1 * t1;
}

// Quint
float easeInQuint(float t) {
    return t * t * t * t * t;
}

float easeOutQuint(float t) {
    float t1 = t - 1.0;
    return 1.0 + t1 * t1 * t1 * t1 * t1;
}

float easeInOutQuint(float t) {
    float t1 = t - 1.0;
    return t < 0.5
        ? 16.0 * t * t * t * t * t
        : 1.0 + 16.0 * t1 * t1 * t1 * t1 * t1;
}

// Sine
float easeInSine(float t) {
    return -1.0 * cos(t * PI * 0.5) + 1.0;
}

float easeOutSine(float t) {
    return sin(t * PI * 0.5);
}

float easeInOutSine(float t) {
    return -0.5 * (cos(PI * t) - 1.0);
}

// Expo
float easeInExpo(float t) {
    return t == 0.0 ? 0.0 : pow(2.0, 10.0 * (t - 1.0));
}

float easeOutExpo(float t) {
    return t == 1.0 ? 1.0 : 1.0 - pow(2.0, -10.0 * t);
}

float easeInOutExpo(float t) {
    if (t == 0.0 || t == 1.0) return t;
    
    return t < 0.5
        ? 0.5 * pow(2.0, (20.0 * t) - 10.0)
        : 0.5 * (-pow(2.0, (-20.0 * t) + 10.0) + 2.0);
}

// Circ
float easeInCirc(float t) {
    return -1.0 * (sqrt(1.0 - t * t) - 1.0);
}

float easeOutCirc(float t) {
    float t1 = t - 1.0;
    return sqrt(1.0 - t1 * t1);
}

float easeInOutCirc(float t) {
    float t1 = 2.0 * t;
    float t2 = t1 - 2.0;
    return t < 0.5
        ? -0.5 * (sqrt(1.0 - t1 * t1) - 1.0)
        : 0.5 * (sqrt(1.0 - t2 * t2) + 1.0);
}

// Elastic
float easeInElastic(float t) {
    if (t == 0.0 || t == 1.0) return t;
    return -pow(2.0, 10.0 * (t - 1.0)) * sin((t - 1.075) * (2.0 * PI) / 0.3);
}

float easeOutElastic(float t) {
    if (t == 0.0 || t == 1.0) return t;
    return pow(2.0, -10.0 * t) * sin((t - 0.075) * (2.0 * PI) / 0.3) + 1.0;
}

float easeInOutElastic(float t) {
    if (t < 0.5) {
        return -0.5 * pow(2.0, 20.0 * t - 10.0) * 
               sin((20.0 * t - 11.125) * (2.0 * PI) / 4.5);
    }
    return pow(2.0, -20.0 * t + 10.0) * 
           sin((20.0 * t - 11.125) * (2.0 * PI) / 4.5) * 0.5 + 1.0;
}

// Back
float easeInBack(float t) {
    float s = 1.70158;
    return t * t * ((s + 1.0) * t - s);
}

float easeOutBack(float t) {
    float s = 1.70158;
    float t1 = t - 1.0;
    return t1 * t1 * ((s + 1.0) * t1 + s) + 1.0;
}

float easeInOutBack(float t) {
    float s = 1.70158 * 1.525;
    t *= 2.0;
    if (t < 1.0) {
        return 0.5 * (t * t * ((s + 1.0) * t - s));
    }
    t -= 2.0;
    return 0.5 * (t * t * ((s + 1.0) * t + s) + 2.0);
}

// Bounce
float easeOutBounce(float t) {
    if (t < 1.0 / 2.75) {
        return 7.5625 * t * t;
    } else if (t < 2.0 / 2.75) {
        t -= 1.5 / 2.75;
        return 7.5625 * t * t + 0.75;
    } else if (t < 2.5 / 2.75) {
        t -= 2.25 / 2.75;
        return 7.5625 * t * t + 0.9375;
    } else {
        t -= 2.625 / 2.75;
        return 7.5625 * t * t + 0.984375;
    }
}

float easeInBounce(float t) {
    return 1.0 - easeOutBounce(1.0 - t);
}

float easeInOutBounce(float t) {
    return t < 0.5
        ? (1.0 - easeOutBounce(1.0 - 2.0 * t)) * 0.5
        : (1.0 + easeOutBounce(2.0 * t - 1.0)) * 0.5;
}