function out = rnd(obj, size)
    m_1 = obj.Mean(1);
    m_2 = obj.Mean(2);
    s_1 = sqrt(obj.Covariance(1));
    s_2 = sqrt(obj.Covariance(4));
    x_1 = normrnd(m_1, s_1, 2, size);
    x_2 = normrnd(m_2 + (s_2*obj.Correlation*(x_1-m_1)/s_1), power(s_2, 2)*sqrt(1-power(obj.Correlation, 2)), 2, size);
    out = x_2;
end